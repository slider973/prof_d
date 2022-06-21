// To parse this JSON data, do
//
//     final timeTable = timeTableFromMap(jsonString);
import 'dart:convert';

class TimeTable {
  TimeTable({
    required this.id,
    required this.title,
    required this.start,
    required this.end,
    this.desc,
    required this.isAllDay,
    required this.isAvailable,
  });

  final String id;
  final String title;
  final DateTime start;
  final DateTime end;
  final String? desc;
  final bool isAllDay;
  final bool isAvailable;

  TimeTable copyWith({
    required String id,
    required String title,
    required DateTime start,
    required DateTime end,
    String? desc,
    required bool isAllDay,
    required bool isAvailable,
  }) =>
      TimeTable(
        id: id,
        title: title,
        start: start,
        end: end,
        desc: desc,
        isAllDay: isAllDay,
        isAvailable: isAvailable,
      );

  factory TimeTable.fromJson(String str) => TimeTable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TimeTable.fromMap(Map<String, dynamic> json) => TimeTable(
        id: json["_id"],
        title: json["title"] ?? '',
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        desc: json["desc"] ?? '',
        isAllDay: json["isAllDay"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "desc": desc,
        "isAllDay": isAllDay,
        "isAvailable": isAvailable,
      };
}
