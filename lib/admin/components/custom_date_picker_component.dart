import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../viewmodels/admin_appointement_viewmodel.dart';

class CustomDatePickerComponent extends ConsumerWidget {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final firstDate = DateTime(2021, 1);
  final lastDate = DateTime(2022, 12);

  CustomDatePickerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adminDashboardMView =
        ref.watch<AdminAppointmentViewModel>(adminAppointmentViewModel);
    return OutlinedButton(
      onPressed: () {
        _openDatePicker(context, adminDashboardMView);
      },
      child: const Text('Selectionnez un rendez vous'),
    );
  }

  _openDatePicker(
      BuildContext context, AdminAppointmentViewModel adminMV) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        locale: Get.locale);

    if (date != null) {
      adminMV.setDate(date);
      _openTimePicker(context, adminMV);
    }
  }

  _openTimePicker(
      BuildContext context, AdminAppointmentViewModel adminMV) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null && adminMV.newTimeTable != null) {
      adminMV.setTime(time);
    }
  }
}
