import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';

import '../../api_prof_d/api_json.swagger.dart';
import '../../core/services/init_services/auth_service.dart';
import '../models/authentification_model.dart';
import '../services/api_json_caller.dart';

class AppAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      String refreshTokenValue =
          await AuthService.instance.getUserRefreshTokenApiStored() ?? '';
      print('AppAuthenticator');
      final ApiJson jsonApi = ApiJsonCaller.instance.apiJsonCallerInstance;
      var tokens = await jsonApi.authRefreshTokenPost(
          body: RefreshTokenDto.fromJson({'refreshToken': refreshTokenValue}));
      final theTokens = AuthentificationModel.fromJson(tokens.body);
      await AuthService.instance
          .setUserRefreshTokenApi(theTokens.refreshToken!);
      await AuthService.instance.setUserTokenApi(theTokens.accessToken!);
      request.headers.remove('Authorization');
      request.headers.putIfAbsent(
          'Authorization', () => 'Bearer ${theTokens.accessToken}');

      return request;
    }
    return null;
  }
}
