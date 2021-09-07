import 'parents/media_model.dart';

class User extends MediaModel {
  String name;
  String username;
  String email;
  String password;
  String apiToken;
  String resetPasswordToken;
  String confirmationToken;
  String confirmed;
  String provider;
  String role;
  String blocked;
  String deviceToken;
  String phone;
  bool verifiedPhone;
  bool isParent;
  String verificationId;
  String address;
  String bio;
  String fullName;
  List<dynamic> appointments;

  bool auth;

  User(
      {this.name,
      this.username,
      this.email,
      this.password,
      this.resetPasswordToken,
      this.confirmationToken,
      this.confirmed,
      this.provider,
      this.role,
      this.blocked,
      this.apiToken,
      this.deviceToken,
      this.phone,
      this.verifiedPhone,
      this.verificationId,
      this.address,
      this.isParent,
      this.fullName,
      this.bio});

  User.fromJson(Map<String, dynamic> json) {
    name = json['fullName'];
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    apiToken = json['apiToken'];
    provider = json['provider'];
    appointments = List<dynamic>.from(json["appointments"].map((x) => x));
    resetPasswordToken = json['resetPasswordToken'];
    confirmationToken = json['confirmationToken'];
    deviceToken = json['deviceToken'];
    phone = json['phone'];
    verifiedPhone = json['verifiedPhone'];
    verificationId = json['verificationId'];
    address = json['address'];
    isParent = json['isParent'];
    bio = json['bio'];
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.fullName;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['provider'] = this.provider;
    data['resetPasswordToken'] = this.resetPasswordToken;
    data['confirmationToken'] = this.confirmationToken;
    data['apiToken'] = this.apiToken;
    data['deviceToken'] = this.deviceToken;
    data['phone'] = this.phone;
    data['verifiedPhone'] = this.verifiedPhone;
    data['verificationId'] = this.verificationId;
    data['address'] = this.address;
    data['isParent'] = this.isParent;
    data['bio'] = this.bio;
    data['appointments'] = List<dynamic>.from(appointments.map((x) => x));
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["fullName"] = fullName;
    map["username"] = username;
    map["thumb"] = mediaThumb;
    map["device_token"] = deviceToken;
    map["isParent"] = isParent;
    map['appointments'] = appointments;
    return map;
  }
}
