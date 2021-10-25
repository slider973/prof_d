// To parse this JSON data, do
//
//     final apiResonseResult = apiResonseResultFromJson(jsonString);

import 'dart:convert';

import 'role_model.dart';
import 'user_strapi_model.dart';

ApiResponseResult apiResponseResultFromJson(String str) =>
    ApiResponseResult.fromJson(json.decode(str));

String apiResponseResultToJson(ApiResponseResult data) =>
    json.encode(data.toJson());

class ApiResponseResult {
  ApiResponseResult({
    this.jwt,
    this.user,
  });

  String jwt;
  UserStrapi user;

  factory ApiResponseResult.fromJson(Map<String, dynamic> json) =>
      ApiResponseResult(
        jwt: json["jwt"],
        user: UserStrapi.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}
