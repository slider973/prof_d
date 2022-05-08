import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutx/flutx.dart';
import 'package:flutx/widgets/widgets.dart';
import '../../../../core/styles/sizes.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../modules/home/components/card_time_table.dart';
import '../../../../modules/home/viewmodel/home_viewmodel.dart';
import 'card_time_tableList_section.dart';

class CardAppointmentListSection extends ConsumerWidget {
  const CardAppointmentListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appointmentRepos = ref.watch(homeViewModelViewModelProvider);
    return Expanded(
        child: Container(
      color: Colors.grey[300],
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (ConnectionState.active != null && !snapshot.hasData) {
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
                CustomButton(
                  onPressed: () {
                    _appointmentRepos.navigateToCreateAppointment(context);
                  },
                  text: 'Prendre un rendez vous',
                )
              ],
            ));
          }

          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          // IF IT WORKS IT GOES HERE!
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final data = snapshot.data[index];
                return const Padding(
                  padding: EdgeInsets.only(left: 9.0, right: 9.0, bottom: 9.0),
                  child: SizedBox(
                    height: 150,
                    child: Text('loading'),
                  ),
                );
              });
        },
        future: _appointmentRepos.getAppointment(),
      ),
    ));
  }
}
