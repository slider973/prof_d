import '../../../api_prof_d/api_json.swagger.dart';
import '../../../authentification/services/api_json_caller.dart';
import '../../../core/services/init_services/auth_service.dart';

class AppointmentRepo {
  final AuthService _authService = AuthService.instance;

  AppointmentRepo._();

  static final AppointmentRepo instance = AppointmentRepo._();

  createAppointment(CreateAppointmentDto body) async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
    ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    final result = await apiJson.appointmentPost(body: body);
    if (result.statusCode == 200 | 201) {
      if (result.body != null) {
        return result.body;
      }
    }
  }
}