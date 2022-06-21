import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/navigate.dart';
import '../models/child.dart';
import '../models/meeting.dart';
import '../models/time_table.dart';
import '../repos/admin_repo.dart';
import '../screens/child_list_parent_screen.dart';
import '../screens/child_selected_screen.dart';
import '../screens/patient_screen.dart';

final adminDashboardModelViewProvider =
    ChangeNotifierProvider<AdminDashboardModelView>(
        (ref) => AdminDashboardModelView(ref));

class AdminDashboardModelView extends ChangeNotifier {
  final AdminRepo _adminRepo = AdminRepo.instance;
  final Ref ref;

  AdminDashboardModelView(this.ref);

  navigateToPatientView(BuildContext context) {
    NavigateUtils.instance
        .navigationFromTheBottomAnimation(context, const PatientScreen());
  }

  getParentList() async {
    final parentListRequest = await _adminRepo.getParentList();
    return parentListRequest.body;
  }

  getAppointment() async {
    final List<TimeTable> timeTableList = <TimeTable>[];
    final List<Meeting> meetings = <Meeting>[];

    final appointmentListRequest = await _adminRepo.getAppointment();

    final result = appointmentListRequest.body as List<dynamic>;
    for (var appointment in result) {
      final newTimeTable = TimeTable.fromMap(appointment);
      timeTableList.add(newTimeTable);
    }
    for (var timetable in timeTableList) {
      meetings.add(Meeting(timetable.title, timetable.start, timetable.end,
          const Color(0xFF009688), timetable.isAllDay));
    }

    return meetings;
  }

  navigateToChildListScreen(List<Child> childList) {
    NavigateUtils.instance.navigationToPageScreen(() => ChildListParentScreen(
          childList: childList,
        ));
  }

  navigateToChildSelectedScreen(Child child) {
    NavigateUtils.instance
        .navigationToPageScreen(() => ChildSelectedScreen(child));
  }
}
