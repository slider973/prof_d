import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../modules/appointement/models/appointment.dart';
import 'list_of_future_appointment.dart';

class MenuSectionStyleAppointment extends StatefulWidget {
  final AsyncSnapshot<Appointment> appointment;

  const MenuSectionStyleAppointment({required this.appointment, Key? key})
      : super(key: key);

  @override
  State<MenuSectionStyleAppointment> createState() =>
      _MenuSectionStyleAppointmentState();
}

class _MenuSectionStyleAppointmentState
    extends State<MenuSectionStyleAppointment> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final appointmentComingSoon = widget.appointment.data!.comingSoon;
    final appointmentPast = widget.appointment.data!.pass;
    List<Widget> lisViewToShow = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListComingAppointment(
          appointmentList: appointmentComingSoon,
          isPast: false,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListComingAppointment(
          appointmentList: appointmentPast,
          isPast: true,
        ),
      )
    ];
    return PreferredSize(
      preferredSize: const Size(double.infinity, 48),
      child: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CupertinoPageScaffold(
          backgroundColor: Colors.grey[300],
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.grey[300],
            border: null,
            automaticallyImplyLeading: false,
            middle: CupertinoSegmentedControl(
              groupValue: count,
              onValueChanged: (int value) {
                setState(() {
                  count = value;
                });
              },
              children: const {
                0: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text('À venir'),
                ),
                1: Text('Passés')
              },
            ),
          ),
          child: lisViewToShow[count],
        ),
      ),
    );
  }
}
