import 'package:flutter/material.dart';

import '../../../shared/card/prof_d_card.dart';
import '../../models/appointment_list.dart';

class AppointmentScreen extends StatelessWidget {
  final List<AppointmentList> appointmentList;

  const AppointmentScreen({Key? key, required this.appointmentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> profdCards = appointmentList
        .map(
          (appointment) => Container(
            width: 380,
            padding: const EdgeInsets.all(18),
            child: ProfDCard(
              appointment: appointment,
            ),
          ),
        )
        .toList();
    return SingleChildScrollView(
      child: Wrap(
        children: profdCards,
      ),
    );
  }
}
