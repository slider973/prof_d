// To parse this JSON data, do
//
//     final slotAppointments = slotAppointmentsFromJson(jsonString);

import 'dart:convert';

import '../parents/model.dart';

SlotAppointments slotAppointmentsFromJson(String str) => SlotAppointments.fromJson(json.decode(str));

String slotAppointmentsToJson(SlotAppointments data) => json.encode(data.toJson());

class SlotAppointments extends Model {
  SlotAppointments({
    this.dateOfStart,
    this.dateOfEnd,
    this.publishedAt,
  });

  DateTime dateOfStart;
  DateTime dateOfEnd;
  DateTime publishedAt;

  factory SlotAppointments.fromJson(Map<String, dynamic> json) => SlotAppointments(
    dateOfStart: DateTime.parse(json["date_of_start"]),
    dateOfEnd: DateTime.parse(json["date_of_end"]),
    publishedAt: DateTime.parse(json["published_at"]),
  );

  Map<String, dynamic> toJson() => {
    "date_of_start": dateOfStart.toIso8601String(),
    "date_of_end": dateOfEnd.toIso8601String(),
    "published_at": publishedAt.toIso8601String(),
  };
}
