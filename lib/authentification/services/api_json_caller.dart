import 'package:chopper/chopper.dart';

import '../../api_prof_d/api_json.swagger.dart';

class ApiJsonCaller {
  static const String _baseUrl = 'http://localhost:3000';
  ApiJson? apiJsonInstance;

  ApiJsonCaller._() {
    apiJsonInstance = ApiJson.create(baseUrl: _baseUrl);
  }

  static final instance = ApiJsonCaller._();

  get apiJsonCallerInstance {
    if (apiJsonInstance != null) {
      apiJsonInstance = ApiJson.create(baseUrl: _baseUrl);
      return apiJsonInstance;
    }
    return apiJsonInstance;
  }

  getInstanceWithAuth(String token) {
    if (apiJsonInstance != null) {
      apiJsonInstance = ApiJson.create(baseUrl: _baseUrl, interceptors: [
        HeadersInterceptor({'Authorization': "Bearer " + token})
      ]);
      return apiJsonInstance;
    }
    return apiJsonInstance;
  }
}
