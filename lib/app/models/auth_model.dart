import 'user_model.dart';

class Auth {
  String jwt;
  User user;

  Auth({this.jwt, this.user});

  Auth.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
