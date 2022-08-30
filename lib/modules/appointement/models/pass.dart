import 'patient.dart';

class Pass {
  Pass({
    required this.appointment,
    required this.patient,
  });
  late final String appointment;
  late final Patient patient;

  Pass.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'];
    patient = Patient.fromJson(json['patient']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appointment'] = appointment;
    _data['patient'] = patient.toJson();
    return _data;
  }
}