import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../shared/component/child_dashboard_component/sections/slot_section.dart';

class CarteTimeTableComponent extends StatelessWidget {
  final String date;
  final dynamic slots;

  const CarteTimeTableComponent(
      {Key? key, required this.date, required this.slots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat("yMMMMEEEEd", 'fr_FR');
    final DateTime dateSelected = DateTime.parse(date);
    final String formatted = formatter.format(dateSelected);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.cardRadius),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListTile(
          leading: const Icon(Icons.event),
          title: CustomText.h4(
            context,
            formatted,
            alignment: Alignment.center,
          ),
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: slots.length,
              itemBuilder: (context, index) {
                final DateFormat formatter = DateFormat("Hm", 'fr_FR');
                final DateTime currentHours = DateTime.parse(slots[index]['date']);
                final String slot = formatter.format(currentHours);
                return SlotSection(
                  slot: slot,
                  date: date,
                  id: slots[index]['id'],
                );
              }),
        ),
      ]),
    );
  }
}
