import 'confirmed.dart';


class Appointments {
  Appointments({
      List<Confirmed>? confirmed, 
      List<dynamic>? done, 
      bool? hasOldAppointmentsAnonymized, 
      bool? hasNextPage,}){
    _confirmed = confirmed;
    _done = done;
    _hasOldAppointmentsAnonymized = hasOldAppointmentsAnonymized;
    _hasNextPage = hasNextPage;
}

  Appointments.fromJson(dynamic json) {
    if (json['confirmed'] != null) {
      _confirmed = [];
      json['confirmed'].forEach((v) {
        _confirmed?.add(v);
      });
    }
    _hasOldAppointmentsAnonymized = json['has_old_appointments_anonymized'];
    _hasNextPage = json['has_next_page'];
  }
  List<Confirmed>? _confirmed;
  List<dynamic>? _done;
  bool? _hasOldAppointmentsAnonymized;
  bool? _hasNextPage;

  List<Confirmed>? get confirmed => _confirmed;
  List<dynamic>? get done => _done;
  bool? get hasOldAppointmentsAnonymized => _hasOldAppointmentsAnonymized;
  bool? get hasNextPage => _hasNextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_confirmed != null) {
      map['confirmed'] = _confirmed?.map((v) => v.toJson()).toList();
    }
    if (_done != null) {
      map['done'] = _done?.map((v) => v.toJson()).toList();
    }
    map['has_old_appointments_anonymized'] = _hasOldAppointmentsAnonymized;
    map['has_next_page'] = _hasNextPage;
    return map;
  }
}





















