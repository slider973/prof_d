class UserProfd {
  String id = '';
  String firstname = '';
  String lastname = '';
  String email = '';
  String apiToken = '';
  String deviceToken = '';
  String phone = '';
  bool verifiedPhone = false;
  String verificationId = '';
  String address = '';
  String civility = '';
  DateTime dateOfBirth = DateTime.now();
  String nameOfBirth = '';
  String cityOfBird = '';
  bool isProfileCreated = false;

  UserProfd();

  UserProfd.fromJson(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      firstname = jsonMap['firstname'] ?? '';
      lastname = jsonMap['lastname'] ?? '';
      email = jsonMap['email'] ?? '';
      apiToken = jsonMap['api_token'];
      civility = jsonMap['civility'];
      deviceToken = jsonMap['device_token'];
      dateOfBirth = jsonMap['dateOfBirth'];
      nameOfBirth = jsonMap['nameOfBirth'];
      cityOfBird = jsonMap['cityOfBird'];
      isProfileCreated = jsonMap['isProfileCreated'];
      try {
        phone = jsonMap['custom_fields']['phone']['view'];
      } catch (e) {
        phone = "";
      }
      try {
        verifiedPhone = jsonMap['custom_fields']['verifiedPhone']['view'] == '1'
            ? true
            : false;
      } catch (e) {
        verifiedPhone = false;
      }
      try {
        address = jsonMap['custom_fields']['address']['view'];
      } catch (e) {
        address = "";
      }
    } catch (e) {
      print(e);
    }
  }
  Map toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["email"] = email;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["api_token"] = apiToken;
    map["device_token"] = deviceToken;
    map["phone"] = phone;
    map["verifiedPhone"] = verifiedPhone;
    map["address"] = address;
    map["dateOfBirth"] = dateOfBirth;
    map["nameOfBirth"] = nameOfBirth;
    map["civility"] = civility;
    map["cityOfBird"] = cityOfBird;
    map["isProfileCreated"] = isProfileCreated;
    return map;
  }

  Map toRestrictMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["civility"] = civility;
    map["email"] = email;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["device_token"] = deviceToken;
    return map;
  }

  @override
  String toString() {
    var map = toMap();
    return map.toString();
  }

  bool profileCompleted() {
    return address != '' && phone != '' && verifiedPhone;
  }
}
