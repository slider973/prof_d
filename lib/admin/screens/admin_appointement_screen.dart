import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../components/custom_prod_d_calendar.dart';
import '../models/meeting.dart';
import '../viewmodels/dahsboard_viewmodel.dart';

class AdminAppointmentScreen extends ConsumerWidget {
  const AdminAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _adminDashboardVM =
        ref.watch<AdminDashboardModelView>(adminDashboardModelViewProvider);
    return FutureBuilder(
        future: _adminDashboardVM.getAppointment(),
        builder: (context, snapshot) {

          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (ConnectionState.active != null && !snapshot.hasData) {
            return const Center(child: Text('Loading'));
          }

          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final meetings = snapshot.data as List<Meeting>;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Rendez vous'),
              backgroundColor: Colors.teal,
            ),
            body: DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'Calendrier'),
                      Tab(text: 'Gestion des rendez vous'),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        children: [
                          CustomProfDCalendar(meetings: meetings),
                          const Text('Number 2')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
