import '../../api_prof_d/api_json.swagger.dart';
import '../../authentification/services/api_json_caller.dart';
import 'package:chopper/chopper.dart' as chopper;

import '../../core/services/init_services/auth_service.dart';

class AdminRepo {
  AdminRepo._();


  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;
  final AuthService _authService = AuthService.instance;
  static final AdminRepo instance = AdminRepo._();

  Future<chopper.Response> getParentList()  async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
    ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    return await apiJson.userGetParentListGet();
  }


  Future<chopper.Response> getAppointment()  async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
    ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    return await apiJson.timeTableGet();
  }

  Future<chopper.Response> createTimeTable(CreateTimeTableDto body)  async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
    ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    return await apiJson.timeTablePost(body: body);
  }
}
