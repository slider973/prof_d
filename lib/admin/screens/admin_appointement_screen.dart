import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text.dart';
import '../components/custom_date_picker_component.dart';
import '../components/custom_prod_d_calendar.dart';
import '../models/meeting.dart';
import '../viewmodels/admin_appointement_viewmodel.dart';
import '../viewmodels/dahsboard_viewmodel.dart';

class AdminAppointmentScreen extends ConsumerWidget {
  const AdminAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _adminDashboardVM =
        ref.watch<AdminDashboardModelView>(adminDashboardModelViewProvider);
    final _adminAppointmentVM =
        ref.watch<AdminAppointmentViewModel>(adminAppointmentViewModel);
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

          final textHoursAndDate =
              _adminAppointmentVM.newTimeTable?.start != null
                  ? [
                      CustomText.h3(
                        context,
                        DateFormat("EEEE d MMM yyyy", "fr_FR")
                            .format(_adminAppointmentVM.newTimeTable!.start!),
                        alignment: Alignment.center,
                      ),
                      const Text("à"),
                      CustomText.h3(
                        context,
                        DateFormat("HH:mm", "fr_FR")
                            .format(_adminAppointmentVM.newTimeTable!.start!),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: Sizes.hPaddingSmall,
                      ),
                      CustomButton(
                        onPressed: () {
                          _adminAppointmentVM.sendRequest(context);
                        },
                        width: 500,
                        child: CustomText.h6(
                          context,
                          'Ajouter',
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                        elevation: 5,
                        minHeight: 20,
                      ),
                    ]
                  : [];

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
                      Tab(text: 'Calendrier de rendez vous'),
                      Tab(text: 'Gestion des rendez vous'),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        children: [
                          CustomProfDCalendar(meetings: meetings),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomDatePickerComponent(),
                              SizedBox(
                                height: Sizes.hPaddingSmall,
                              ),
                              ...textHoursAndDate,
                            ],
                          )
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
