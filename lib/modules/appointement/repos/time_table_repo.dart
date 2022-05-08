import '../../../api_prof_d/api_json.swagger.dart';
import '../../../authentification/services/api_json_caller.dart';
import 'package:chopper/chopper.dart' as chopper;
class TimeTableRepo {
  TimeTableRepo._();
  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;
  static final TimeTableRepo instance = TimeTableRepo._();
  Future<chopper.Response> getTimeTable()  async {
    return await apiJson.timeTableFindByDateGet();
  }

  Future<chopper.Response> getAppointment()  async {
    return await apiJson.appointmentGetByParentGet();
  }
}
