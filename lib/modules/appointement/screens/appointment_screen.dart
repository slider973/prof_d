import 'package:flutter/material.dart';

import '../../../shared/component/child_dashboard_component/sections/card_time_appointment_list_section.dart';
import '../../../shared/component/child_dashboard_component/sections/card_time_tableList_section.dart';
import '../../home/components/dashboard/app_bar.dart';
import '../component/child_dashboard_component.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarComponent,
      body:  const Center(
        child:  HeaderWidget(
            childrenWidget: [
              CardAppointmentListSection()
            ],
          title: 'Mes rendez-vous',
        ),
      ),
    );
  }
}
