// To parse this JSON data, do
//
//     final appointments = appointmentsFromJson(jsonString);

import 'dart:convert';

Appointments appointmentsFromJson(String str) => Appointments.fromJson(json.decode(str));

String appointmentsToJson(Appointments data) => json.encode(data.toJson());

class Appointments {
  Appointments({
    this.dateOfStart,
    this.dateOfEnd,
    this.price,
    this.usersPermissionsUser,
    this.addresses,
    this.isPaid,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
  });

  DateTime dateOfStart;
  DateTime dateOfEnd;
  int price;
  String usersPermissionsUser;
  List<String> addresses;
  bool isPaid;
  DateTime publishedAt;
  String createdBy;
  String updatedBy;

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
    dateOfStart: DateTime.parse(json["date_of_start"]),
    dateOfEnd: DateTime.parse(json["date_of_end"]),
    price: json["price"],
    usersPermissionsUser: json["users_permissions_user"],
    addresses: List<String>.from(json["addresses"].map((x) => x)),
    isPaid: json["isPaid"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "date_of_start": dateOfStart.toIso8601String(),
    "date_of_end": dateOfEnd.toIso8601String(),
    "price": price,
    "users_permissions_user": usersPermissionsUser,
    "addresses": List<dynamic>.from(addresses.map((x) => x)),
    "isPaid": isPaid,
    "published_at": publishedAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}
