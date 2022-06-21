import 'package:chopper/chopper.dart';

import '../../api_prof_d/api_json.swagger.dart';
import '../interceptor/interceptor.dart';

class ApiJsonCaller {
  ChopperClient? chopperClient;

  ApiJson? apiJsonInstance;

  setChopperClient(ChopperClient chopperClient) {
    chopperClient = chopperClient;
  }

  ApiJsonCaller._();

  static final instance = ApiJsonCaller._();

  get apiJsonCallerInstance {
    return apiJsonInstance;
  }

  initClient(ChopperClient chopperClient){
    apiJsonInstance = ApiJson.create(
      client: chopperClient,
    );
    return apiJsonInstance;
  }

}
