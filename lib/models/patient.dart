class Patient {
  Patient({
    String? id,
    String? firstName,
    String? lastName,
    int? masterPatientId,
    bool? child,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _masterPatientId = masterPatientId;
    _child = child;
  }

  Patient.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _masterPatientId = json['master_patient_id'];
    _child = json['child'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  int? _masterPatientId;
  bool? _child;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  int? get masterPatientId => _masterPatientId;
  bool? get child => _child;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['master_patient_id'] = _masterPatientId;
    map['child'] = _child;
    return map;
  }

}