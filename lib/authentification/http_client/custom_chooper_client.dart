import 'package:chopper/chopper.dart';

import '../../config/config_route_collection.dart';
import '../../core/services/init_services/auth_service.dart';
import '../interceptor/app_authenticator.dart';

class CustomChopperClient {
  static ChopperClient createChopperClient() {
    final client = ChopperClient(
      baseUrl: getBackendUrl,
      converter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        (Request request) async {
          final token = await AuthService.instance.getUserTokenApiStored();
          var newRequest = request;
          if (token != null) {
            newRequest = request.copyWith(headers: {
              'Accept': "application/json",
              'Content-type': "application/json",
              'Authorization': "Bearer $token",
            });
          }
          return newRequest;
        },
      ],
      authenticator: AppAuthenticator(),
    );
    return client;
  }
}


// .copyWith(headers: {
//             'Accept': "application/json",
//             'Content-type': "application/json",
//             'Authorization': "Bearer $token",
//           });