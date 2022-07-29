import 'package:meta/meta.dart';
import 'dart:convert';

import 'child.dart';

class Parent {
  Parent({
    required this.id,
    required this.isProfileCreated,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.childList,
  });

  final String id;
  final bool isProfileCreated;
  final String email;
  final String firstname;
  final String lastname;
  final String phone;
  final List<Child> childList;

  Parent copyWith({
    required String id,
    required bool isProfileCreated,
    required String email,
    required String firstname,
    required String lastname,
    required String phone,
    required List<Child> childList,
  }) =>
      Parent(
        id: id,
        isProfileCreated: isProfileCreated,
        email: email,
        firstname: firstname,
        lastname: lastname,
        phone: phone,
        childList: childList,
      );

  factory Parent.fromJson(String str) => Parent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parent.fromMap(Map<String, dynamic> json) => Parent(
        id: json["id"],
        isProfileCreated: json["isProfileCreated"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        childList:
            List<Child>.from(json["childList"].map((x) => Child.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "isProfileCreated": isProfileCreated,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "childList": List<Child>.from(childList.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'firstname: $firstname,'
        'lastname: $lastname,'
    'childList: $childList,'
        'id: $id';
  }
}
