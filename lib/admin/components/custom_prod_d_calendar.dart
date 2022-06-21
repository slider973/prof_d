import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/meeting.dart';
import '../models/meeting_data_source.dart';

class CustomProfDCalendar extends StatelessWidget {
  List<Meeting> meetings = [];
  static const List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.day,
    CalendarView.week,
    CalendarView.workWeek,
    CalendarView.month,
    CalendarView.timelineDay,
    CalendarView.timelineWeek,
    CalendarView.timelineWorkWeek,
    CalendarView.timelineMonth,
  ];

  CustomProfDCalendar({Key? key, required this.meetings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      allowAppointmentResize: true,
      view: CalendarView.week,
      allowViewNavigation: true,
      showNavigationArrow: true,
      allowedViews: _allowedViews,
      allowDragAndDrop: false,
      timeZone: 'Romance Standard Time',
      firstDayOfWeek: 1,
      showDatePickerButton: true,
      showCurrentTimeIndicator: true,
      dataSource: MeetingDataSource(meetings),
    );
  }
}
