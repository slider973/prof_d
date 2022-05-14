class Patient {
  Patient({
    required this.firstname,
    required this.lastname,
  });
  late final String firstname;
  late final String lastname;

  Patient.fromJson(Map<String, dynamic> json){
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    return _data;
  }
}