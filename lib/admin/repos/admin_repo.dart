import '../../api_prof_d/api_json.swagger.dart';
import '../../authentification/services/api_json_caller.dart';
import 'package:chopper/chopper.dart' as chopper;

import '../../core/services/init_services/auth_service.dart';

class AdminRepo {
  AdminRepo._();

  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;
  static final AdminRepo instance = AdminRepo._();

  Future<chopper.Response> getParentList() async {
    return await apiJson.userGetParentListGet();
  }

  Future<chopper.Response> getAppointment() async {
    return await apiJson.timeTableGet();
  }

  Future<chopper.Response> getFollowSubject() async {
    return await apiJson.followUpSubjectGet();
  }

  Future<chopper.Response> createTimeTable(CreateTimeTableDto body) async {
    return await apiJson.timeTablePost(body: body);
  }

  Future<chopper.Response> sendFollowUpDetails(
      CreateFollowUpDetailDto body) async {
    return await apiJson.followUpDetailsPost(body: body);
  }

  Future<chopper.Response> sendFollowUp(
      CreateFollowUpDto body) async {
    return await apiJson.followUpPost(body: body);
  }

  Future<chopper.Response> getFollowUpByChild(
      String id) async {
    return await apiJson.followUpChildIdGet(id: id);
  }
}
