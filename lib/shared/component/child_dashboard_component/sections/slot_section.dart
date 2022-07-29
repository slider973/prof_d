import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../modules/account/viewmodels/child_screen_view_model.dart';
import '../../../../modules/appointement/viewmodel/appointment_view_model.dart';
import 'hours_list_button.dart';

class SlotSection extends ConsumerWidget {
  const SlotSection({
    Key? key,
    required this.slot,
    required this.id,
    required this.date,
  }) : super(key: key);

  final String id;
  final String slot;
  final String date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _childViewModel = ref.watch<ChildViewModel>(childViewModelProvider);

    final _appointmentViewModel =
        ref.watch<AppointmentViewModel>(appointmentViewModel);

    return FutureBuilder(
      future: _childViewModel.getChildList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final fistChild = _childViewModel.childList.first;
          return HoursListButton(
            slot: slot,
            appointmentViewModel: _appointmentViewModel,
            id: id,
            fistChild: fistChild,
            date: date,
          );
        }
        return Container();
      },
    );
  }
}
