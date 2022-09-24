import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../admin/models/appointment_list.dart';
import '../../admin/viewmodels/dahsboard_viewmodel.dart';
import '../../admin/viewmodels/following_viewmodel.dart';
import '../../api_prof_d/api_json.swagger.dart';
import '../../core/styles/sizes.dart';
import '../../services/date_parser.dart';

class ProfDCard extends ConsumerWidget {
  final AppointmentList appointment;

  const ProfDCard({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _followingVM = ref.watch(followingViewModelProvider);
    final _adminDashVM =
        ref.watch<AdminDashboardModelView>(adminDashboardModelViewProvider);
    navigateToEvaluateAction() {
      _followingVM.setFollowupDetail(appointment.id);
      _followingVM.navigateToAddFollowingScreen(appointment.id);
    }

    navigateToDeploymentInvoices() {
      if (kDebugMode) {
        print('deploi the invoices');
      }

      final parent = _adminDashVM.getParent()!;

      final invoices = CreateInvoicesDto(
          firstname: parent.firstname,
          lastname: parent.lastname,
          parentId: parent.id);
      _adminDashVM.sendInvoices(invoices);
    }

    return SizedBox(
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.teal, spreadRadius: 3),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(context, DateTime.parse(appointment.timeTable.start)),
            Expanded(
              child: Center(
                child: _buildMakeAppointmentAgainButton(
                    appointment.isEvaluated
                        ? navigateToDeploymentInvoices
                        : navigateToEvaluateAction,
                    Text(
                      appointment.isEvaluated
                          ? 'Mise en ligne de la facture'
                          : 'Evaluer le rendez vous',
                      style: const TextStyle(height: 1.0, fontSize: 12),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_buildHeader(BuildContext context, DateTime date) {
  return Container(
    color: Colors.teal,
    height: 38.0,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 250,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: Sizes.hPaddingSmallest,
              ),
              Text(
                DateParser.instance.convertDayUTCToFrLocal(date).toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.access_alarm,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              width: Sizes.hPaddingSmallest,
            ),
            Text(
              DateParser.instance.convertHourUTCToFrLocal(date).toString(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    ),
  );
}

ElevatedButton _buildMakeAppointmentAgainButton(cb, Widget child) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: const StadiumBorder(),
        elevation: 0),
    onPressed: () {
      cb();
    },
    child: child,
  );
}
