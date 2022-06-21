import 'package:chopper/chopper.dart';

import '../../core/services/init_services/auth_service.dart';
import '../interceptor/app_authenticator.dart';

class CustomChopperClient {
  static ChopperClient createChopperClient() {
    final client = ChopperClient(
      baseUrl: 'http://192.168.68.120:3000',
      converter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        (Request request) async {
          final token = await AuthService.instance.getUserTokenApiStored();
          print('token in ChopperClient: $token');
          return request.copyWith(headers: {
            'Accept': "application/json",
            'Content-type': "application/json",
            'Authorization':
                "Bearer $token",
          });
        },
      ],
      authenticator: AppAuthenticator(),
    );
    return client;
  }
}
