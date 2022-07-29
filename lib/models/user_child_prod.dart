class UserChildProfd {
  String id = '';
  String firstname = '';
  String lastname = '';
  String civility = '';
  DateTime dateOfBirth = DateTime.now();
  String nameOfBirth = '';
  String cityOfBird = '';

  UserChildProfd();

  UserChildProfd.fromJson(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      firstname = jsonMap['firstname'] ?? '';
      lastname = jsonMap['lastname'] ?? '';
      civility = jsonMap['civility'];
      dateOfBirth = jsonMap['dateOfBirth'];
      nameOfBirth = jsonMap['nameOfBirth'];
      cityOfBird = jsonMap['cityOfBird'];
    } catch (e) {
      print(e);
    }
  }
  Map toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["dateOfBirth"] = dateOfBirth;
    map["nameOfBirth"] = nameOfBirth;
    map["civility"] = civility;
    map["cityOfBird"] = cityOfBird;
    return map;
  }

  Map toMapFiresbase() {
    var map = <dynamic, dynamic>{};
    map["id"] = id;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["dateOfBirth"] = dateOfBirth;
    map["nameOfBirth"] = nameOfBirth;
    map["civility"] = civility;
    map["cityOfBird"] = cityOfBird;
    return map;
  }

  Map toRestrictMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["civility"] = civility;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    return map;
  }

  @override
  String toString() {
    var map = toMap();
    return map.toString();
  }
}
