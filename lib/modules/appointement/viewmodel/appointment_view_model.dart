import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_prof_d/api_json.models.swagger.dart';
import '../repos/appointment_repo.dart';

final appointmentViewModel = ChangeNotifierProvider<AppointmentViewModel>(
    (ref) => AppointmentViewModel(ref));

class AppointmentViewModel extends ChangeNotifier {
  final Ref ref;
  CreateAppointmentDto newAppointment = CreateAppointmentDto();

  AppointmentViewModel(this.ref);

  create(CreateAppointmentDto newAppointment) {
    this.newAppointment = newAppointment;
    notifyListeners();
  }

  setChild(String idChild) {
    newAppointment = newAppointment.copyWith(patient: idChild);
    if (kDebugMode) {
      print('child: $idChild added');
    }
  }

  setTimeTableId(timeTableId) {
    newAppointment = newAppointment.copyWith(timeTableId: timeTableId);
    if (kDebugMode) {
      print('setTimeTableId: $timeTableId added');
    }
  }

  createAppointment() async {
    AppointmentRepo.instance.createAppointment(newAppointment);
  }
}
