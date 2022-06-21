import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/custom_text.dart';
import '../viewmodels/dahsboard_viewmodel.dart';

class PatientSectionComponent extends ConsumerWidget {
  const PatientSectionComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adminDashboardMV =
        ref.watch<AdminDashboardModelView>(adminDashboardModelViewProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 1.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print('it\'s works');
          }
          adminDashboardMV.navigateToPatientView(context);
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText.h3(
                context,
                'Mes patients',
                alignment: Alignment.center,
                weight: FontWeight.bold,
              ),
              SvgPicture.asset(
                'assets/images/admin/patient.svg',
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
