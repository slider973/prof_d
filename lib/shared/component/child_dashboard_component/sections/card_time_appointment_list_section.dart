import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../modules/appointement/models/appointment.dart';
import '../../../../modules/home/viewmodel/home_viewmodel.dart';
import 'appointment_list.dart';
import 'empty_state_appointment.dart';

class CardAppointmentListSection extends ConsumerWidget {
  const CardAppointmentListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeViewModel = ref.watch(homeViewModelViewModelProvider);
    return Expanded(
        child: Container(
      color: Colors.grey[300],
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<Appointment> snapshot) {
          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return EmptyStateAppointment(appointmentRepos: _homeViewModel);
          }

          // IF IT WORKS IT GOES HERE!
          return MenuSectionStyleAppointment(
            appointment: snapshot,
          );
        },
        future: _homeViewModel.getAppointment(),
      ),
    ));
  }
}
