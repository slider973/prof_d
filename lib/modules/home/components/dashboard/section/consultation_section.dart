import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../viewmodel/home_viewmodel.dart';
import '../../empty_state_consulting.dart';
import '../card_component/consulting_component.dart';

class ConsultationSection extends ConsumerWidget {
  const ConsultationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeVM = ref.watch(homeViewModelViewModelProvider);

    Widget? hasAppointment = _homeVM.appointmentList.comingSoon.isNotEmpty
        ? const ConsultingComponent()
        : const EmptyStateConsulting();
    return FutureBuilder(
      future: _homeVM.getAppointment(),
      builder: (context, snapshot) {
        return StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: hasAppointment,
                ),
              )),
        );
      }
    );
  }
}
