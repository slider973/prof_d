import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/sizes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../modules/home/viewmodel/home_viewmodel.dart';

class EmptyStateAppointment extends ConsumerWidget {
  final bool isAppear;
   const EmptyStateAppointment(this.isAppear, {
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeViewModel = ref.watch(homeViewModelViewModelProvider);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/appointment/empty_state/no_appointment.svg',
              height: 180,
            ),
            SizedBox(
              height: Sizes.hPaddingHigh,
            ),
            CustomText.h4(
              context,
              "Vous n'avez aucun rendez-vous",
              alignment: Alignment.center,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Sizes.hPaddingHighest,
            ),
            isAppear ? CustomButton(
              onPressed: () {
                _homeViewModel.navigateToCreateAppointment(context);
              },
              text: 'Prendre un rendez vous',
            ) : const SizedBox.shrink()
          ],
        ));
  }
}
