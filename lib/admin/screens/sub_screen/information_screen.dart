import 'package:flutter/material.dart';

import '../../components/build_row.dart';
import '../../components/container_child_section_component.dart';
import '../../models/child.dart';

import 'package:intl/intl.dart' show DateFormat;

class InformationScreen extends StatelessWidget {
  final Child childSelected;

  const InformationScreen({Key? key, required this.childSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final age = int.parse(DateFormat.y('fr').format(DateTime.now())) -
        int.parse(DateFormat.y('fr').format(childSelected.dateOfBirth));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          height: 400,
          child: ContainerChildSectionComponent(children: [
            BuildRow(
              children: [
                const Text(
                  'Troubles et/ou difficultés repérés',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.identifiedDisordersAndOrDifficulties)
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Aménagements mis en place dans la classe',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.arrangementsInTheClassroom)
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Date de naissance',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  DateFormat.yMMMMEEEEd('fr').format(childSelected.dateOfBirth),
                ),
                Text(' ($age ans) ')
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Nombre de frères et sœurs',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.numberOfBrotherAndSister.toString())
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Place dans la fratrie',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.placeInTheSiblingGroup)
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Lieu de scolarisation',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.placeOfSchooling)
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'en classe de',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.classLevel)
              ],
            ),
            BuildRow(
              children: [
                const Text(
                  'Suivis en cours',
                  style: TextStyle(color: Colors.white),
                ),
                Text(childSelected.followUpsInProgress)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}


