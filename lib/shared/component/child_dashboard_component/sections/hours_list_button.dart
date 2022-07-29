import 'package:flutter/material.dart';

import '../../../../core/utils/navigate.dart';
import '../../../../modules/account/models/child_model.dart';
import '../../../../modules/appointement/viewmodel/appointment_view_model.dart';
import 'appointment_creation_form.dart';

class HoursListButton extends StatelessWidget {
  const HoursListButton({
    Key? key,
    required this.slot,
    required AppointmentViewModel appointmentViewModel,
    required this.id,
    required this.fistChild,
    required this.date,
  })  : _appointmentViewModel = appointmentViewModel,
        super(key: key);

  final String slot;
  final AppointmentViewModel _appointmentViewModel;
  final String id;
  final ChildModel fistChild;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        children: [
          TextButton(
            child: Text(slot),
            onPressed: () {
              _appointmentViewModel.setTimeTableId(id);
              _appointmentViewModel.setChild(fistChild.id);

              NavigateUtils.instance.navigationFromTheBottomAnimation(
                context,
                AppointmentCreationForm(slot, date),
              );
            },
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
