// To parse this JSON data, do
//
//     final apiResponseResultParentAdmin = apiResponseResultParentAdminFromJson(jsonString);

import 'dart:convert';

import '../address_model.dart';
import 'admin_user.dart';

List<ApiResponseResultParentAdmin> apiResponseResultParentAdminFromJson(String str) => List<ApiResponseResultParentAdmin>.from(json.decode(str).map((x) => ApiResponseResultParentAdmin.fromJson(x)));

String apiResponseResultParentAdminToJson(List<ApiResponseResultParentAdmin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiResponseResultParentAdmin {
  ApiResponseResultParentAdmin({
    this.addresses,
    this.id,
    this.isActive,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.adminUser,
    this.apiResponseResultParentAdminId,
  });

  List<Address> addresses;
  String id;
  bool isActive;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AdminUser adminUser;
  String apiResponseResultParentAdminId;

  factory ApiResponseResultParentAdmin.fromJson(Map<String, dynamic> json) => ApiResponseResultParentAdmin(
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    id: json["_id"],
    isActive: json["isActive"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    adminUser: AdminUser.fromJson(json["admin_user"]),
    apiResponseResultParentAdminId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    "_id": id,
    "isActive": isActive,
    "published_at": publishedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "admin_user": adminUser.toJson(),
    "id": apiResponseResultParentAdminId,
  };
}


