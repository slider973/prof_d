// To parse this JSON data, do
//
//     final childModel = childModelFromJson(jsonString);

import 'dart:convert';

class ChildModel {
  ChildModel({
    required this.firstname,
    required this.lastname,
    required this.id,
  });

  final String firstname;
  final String lastname;
  final String id;

  ChildModel copyWith({
    required String firstname,
    required String lastname,
    required String id,
  }) =>
      ChildModel(
        firstname: firstname,
        lastname: lastname,
        id: id,
      );

  factory ChildModel.fromRawJson(String str) =>
      ChildModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChildModel.fromJson(Map<String, dynamic> json) => ChildModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "id": id,
      };
}
