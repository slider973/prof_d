import '../../../api_prof_d/api_json.swagger.dart';
import '../../../authentification/services/api_json_caller.dart';
import 'package:chopper/chopper.dart' as chopper;

import '../../../core/services/init_services/auth_service.dart';
class TimeTableRepo {
  TimeTableRepo._();
  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;
  final AuthService _authService = AuthService.instance;
  static final TimeTableRepo instance = TimeTableRepo._();
  Future<chopper.Response> getTimeTable()  async {
    return await apiJson.timeTableFindByDateGet();
  }

  Future<chopper.Response> getAppointment()  async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
    ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    return await apiJson.appointmentGetByParentGet();
  }
}
