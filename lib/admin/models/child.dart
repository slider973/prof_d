import 'dart:convert';

import 'appointment_list.dart';

class Child {
  Child({
    required this.firstname,
    required this.lastname,
    required this.dateOfBirth,
    required this.placeInTheSiblingGroup,
    required this.placeOfSchooling,
    required this.classLevel,
    required this.followUpsInProgress,
    required this.numberOfBrotherAndSister,
    required this.identifiedDisordersAndOrDifficulties,
    required this.arrangementsInTheClassroom,
    required this.behaviourInTheHome,
    required this.id,
    required this.appointmentList,
  });

  final String firstname;
  final String lastname;
  final DateTime dateOfBirth;
  final String placeInTheSiblingGroup;
  final String placeOfSchooling;
  final String classLevel;
  final String followUpsInProgress;
  final int numberOfBrotherAndSister;
  final String identifiedDisordersAndOrDifficulties;
  final String arrangementsInTheClassroom;
  final String behaviourInTheHome;
  final String id;
  late final List<AppointmentList> appointmentList;

  Child copyWith({
    required String firstname,
    required String lastname,
    required DateTime dateOfBirth,
    required String placeInTheSiblingGroup,
    required String placeOfSchooling,
    required int numberOfBrotherAndSister,
    required String classLevel,
    required String followUpsInProgress,
    required String identifiedDisordersAndOrDifficulties,
    required String arrangementsInTheClassroom,
    required String behaviourInTheHome,
    required String id,
  }) =>
      Child(
          firstname: firstname,
          lastname: lastname,
          dateOfBirth: dateOfBirth,
          placeInTheSiblingGroup: placeInTheSiblingGroup,
          placeOfSchooling: placeOfSchooling,
          numberOfBrotherAndSister: numberOfBrotherAndSister,
          classLevel: classLevel,
          followUpsInProgress: followUpsInProgress,
          identifiedDisordersAndOrDifficulties:
              identifiedDisordersAndOrDifficulties,
          arrangementsInTheClassroom: arrangementsInTheClassroom,
          behaviourInTheHome: behaviourInTheHome,
          id: id,
          appointmentList: appointmentList);

  factory Child.fromJson(String str) => Child.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Child.fromMap(Map<String, dynamic> json) => Child(
        firstname: json["firstname"],
        lastname: json["lastname"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        placeInTheSiblingGroup: json["placeInTheSiblingGroup"],
        numberOfBrotherAndSister: json["numberOfBrotherAndSister"],
        placeOfSchooling: json["placeOfSchooling"],
        classLevel: json["classLevel"],
        followUpsInProgress: json["followUpsInProgress"],
        identifiedDisordersAndOrDifficulties:
            json["identifiedDisordersAndOrDifficulties"],
        arrangementsInTheClassroom: json["arrangementsInTheClassroom"],
        behaviourInTheHome: json["behaviourInTheHome"],
        id: json["id"],
        appointmentList: List.from(json['appointmentList'])
            .map((e) => AppointmentList.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "lastname": lastname,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "placeInTheSiblingGroup": placeInTheSiblingGroup,
        "numberOfBrotherAndSister": numberOfBrotherAndSister,
        "placeOfSchooling": placeOfSchooling,
        "classLevel": classLevel,
        "followUpsInProgress": followUpsInProgress,
        "identifiedDisordersAndOrDifficulties":
            identifiedDisordersAndOrDifficulties,
        "arrangementsInTheClassroom": arrangementsInTheClassroom,
        "behaviourInTheHome": behaviourInTheHome,
        "id": id,
        "appointmentList": appointmentList.map((e) => e.toJson()).toList()
      };

  @override
  String toString() {
    return 'firstname: $firstname,'
        'lastname: $lastname,'
        ' numberOfBrotherAndSister: $numberOfBrotherAndSister, '
        'dateOfBirth: ${dateOfBirth.toIso8601String()},'
        'placeInTheSiblingGroup: $placeInTheSiblingGroup,'
        'placeOfSchooling: $placeOfSchooling, '
        'classLevel: $classLevel, '
        'followUpsInProgress: $followUpsInProgress, '
        'identifiedDisordersAndOrDifficulties: $identifiedDisordersAndOrDifficulties,'
        ' arrangementsInTheClassroom: $arrangementsInTheClassroom,'
        ' behaviourInTheHome: $behaviourInTheHome, '
        'id: $id';
  }
}
