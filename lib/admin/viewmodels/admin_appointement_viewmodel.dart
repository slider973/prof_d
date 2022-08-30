import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api_prof_d/api_json.models.swagger.dart';
import '../repos/admin_repo.dart';

final adminAppointmentViewModel =
    ChangeNotifierProvider<AdminAppointmentViewModel>(
        (ref) => AdminAppointmentViewModel(ref));

class AdminAppointmentViewModel extends ChangeNotifier {

  final ChangeNotifierProviderRef<AdminAppointmentViewModel> ref;
  CreateTimeTableDto? newTimeTable;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  AdminRepo repo = AdminRepo.instance;

  AdminAppointmentViewModel(this.ref);



  setDate(DateTime date) {
    newTimeTable = CreateTimeTableDto(start: date);
    if (kDebugMode) {
      print('newTimeTable 1: $newTimeTable');
    }
    notifyListeners();
  }

  setTime(TimeOfDay time) {
    newTimeTable = CreateTimeTableDto(
      start: DateTime(
        newTimeTable!.start.year,
        newTimeTable!.start.month,
        newTimeTable!.start.day,
      ).add(
        Duration(
          minutes: time.minute,
          hours: time.hour,
        ),
      ),
      end: DateTime(
        newTimeTable!.start.year,
        newTimeTable!.start.month,
        newTimeTable!.start.day,
      ).add(
        Duration(
          minutes: time.minute,
          hours: time.hour + 1,
        ),
      ),
    );
    notifyListeners();
  }

  sendRequest(BuildContext context) async {
    try {
      if (kDebugMode) {
        print('add appointment...');
      }
      CreateTimeTableDto? copyNewTimeTable = newTimeTable;
      if (copyNewTimeTable != null) {
        repo.createTimeTable(copyNewTimeTable);
        if (kDebugMode) {
          print('timeTable added');
        }
        const snackBar = SnackBar(content: Text('La date à été ajouter'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        newTimeTable = null;
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('erreur');
      }
    }
  }
}
