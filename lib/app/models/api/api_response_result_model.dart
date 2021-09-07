// To parse this JSON data, do
//
//     final apiResonseResult = apiResonseResultFromJson(jsonString);

import 'dart:convert';

import 'role_model.dart';
import 'user_strapi_model.dart';

ApiResonseResult apiResonseResultFromJson(String str) =>
    ApiResonseResult.fromJson(json.decode(str));

String apiResonseResultToJson(ApiResonseResult data) =>
    json.encode(data.toJson());

class ApiResonseResult {
  ApiResonseResult({
    this.jwt,
    this.user,
  });

  String jwt;
  UserStrapi user;

  factory ApiResonseResult.fromJson(Map<String, dynamic> json) =>
      ApiResonseResult(
        jwt: json["jwt"],
        user: UserStrapi.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}
