import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_text.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../components/build_date_of_birth_row.dart';
import '../components/header_component.dart';
import '../models/child.dart';

class ChildSelectedScreen extends ConsumerWidget {
  final Child childSelected;

  const ChildSelectedScreen(this.childSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(childSelected.toString());
    final List<Widget> detailsInformation = [
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Date de naissance:'),
          CustomText(
            DateFormat.yMMMMEEEEd('fr').format(childSelected.dateOfBirth),
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Nombre de frères et sœurs:'),
          CustomText(
            childSelected.numberOfBrotherAndSister.toString(),
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Place dans la fratrie:'),
          CustomText(
            childSelected.placeInTheSiblingGroup,
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Lieu de scolarisation:'),
          CustomText(
            childSelected.placeOfSchooling,
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('en classe de:'),
          CustomText(
            childSelected.classLevel,
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Suivis en cours:'),
          CustomText(
            childSelected.followUpsInProgress,
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Troubles et/ou difficultés repérés:'),
          CustomText(
            childSelected.identifiedDisordersAndOrDifficulties,
          )
        ],
      ),
      BuildDateOfBirthRow(
        childSelected: childSelected,
        children: [
          CustomText('Aménagements mis en place dans la classe:'),
          CustomText(
            childSelected.arrangementsInTheClassroom,
          )
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${childSelected.lastname.toUpperCase()} ${childSelected.firstname}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderComponent(),
            DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(text: 'Informations'),
                        Tab(text: 'Tab 2'),
                        Tab(text: 'Tab 3'),
                        Tab(text: 'Tab 4'),
                      ],
                    ),
                    SizedBox(
                      height: Sizes.hMarginSmall,
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Text('Number 1'),
                          Text('Number 2'),
                          Text('Number 3'),
                          Text('Number 4')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
