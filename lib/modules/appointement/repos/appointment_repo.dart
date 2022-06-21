import '../../../api_prof_d/api_json.swagger.dart';
import '../../../authentification/services/api_json_caller.dart';
import '../../../core/services/init_services/auth_service.dart';

class AppointmentRepo {
  final AuthService _authService = AuthService.instance;

  AppointmentRepo._();
  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;
  static final AppointmentRepo instance = AppointmentRepo._();

  createAppointment(CreateAppointmentDto body) async {
    final result = await apiJson.appointmentPost(body: body);
    print(result.headers);
    if (result.statusCode == 200 | 201) {
      if (result.body != null) {
        return result.body;
      }
    }
  }
}
