import 'dart:async';

import 'package:chopper/chopper.dart';

class AppInterceptors extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    // TODO: implement onResponse

    if (response.statusCode == 401) {
      print('refresh le token man');
    }

    return response;
  }
}
