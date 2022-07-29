class AppointmentRules {
  AppointmentRules({
    int? id,
    String? message,
  }) {
    _id = id;
    _message = message;
  }

  AppointmentRules.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
  }
  int? _id;
  String? _message;

  int? get id => _id;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    return map;
  }
}
