import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/component/child_dashboard_component/sections/card_time_appointment_list_section.dart';
import '../../home/components/dashboard/app_bar.dart';
import '../../home/viewmodel/home_viewmodel.dart';
import '../component/child_dashboard_component.dart';

class AppointmentScreen extends ConsumerWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeViewModel = ref.watch(homeViewModelViewModelProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _homeViewModel.navigateToCreateAppointment(context);
        },
        child: const Icon(Icons.search),
      ),
      appBar: buildAppBarComponent,
      body: const Center(
        child: HeaderWidget(
          title: 'Mes rendez-vous',
          childrenWidget: [CardAppointmentListSection()],
        ),
      ),
    );
  }
}
