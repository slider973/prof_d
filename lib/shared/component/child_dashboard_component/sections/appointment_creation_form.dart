import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutx/flutx.dart';

import '../../../../core/styles/sizes.dart';
import '../../../../modules/account/viewmodels/child_screen_view_model.dart';
import '../../../../modules/appointement/viewmodel/appointment_view_model.dart';
import '../../../../widgets/child_select_radio.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/field_date_view.dart';

class AppointmentCreationForm extends ConsumerWidget {
  final String slot;
  final String date;
  const AppointmentCreationForm(this.slot, this.date, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appointmentViewModel =
        ref.watch<AppointmentViewModel>(appointmentViewModel);
    final _childViewModel = ref.watch<ChildViewModel>(childViewModelProvider);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 0,
          title: const Text('Réservation'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FxSpacing.height(34),
              SvgPicture.asset(
                'assets/images/appointment/clock.svg',
                height: 100,
              ),
              FxText.l2(
                'Votre rendez-vous n\'est pas confirmé.',
                fontSize: 15,
                fontWeight: 800,
              ),
              FieldDateView(
                day: DateTime.parse(date),
                hour: DateFormat("Hm", 'fr_FR').parse(slot),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FxCard.bordered(
                  height: Sizes.cardHRegular,
                  child: Column(
                    children: [
                      FxText.sh1(
                        'Pour qui prenez-vous ce rendez-vous ?',
                        fontWeight: 700,
                      ),
                      ChildRadioSelect(
                        dataList: _childViewModel.childList,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: FxCard.bordered(
                  width: double.infinity,
                  child: Column(
                    children: [
                      FxButton.block(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(28.0)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Demande de confirmation'),
                                  content: const Text(
                                      'Êtes-vous sûr de vouloir confirmer cette réservation ?'),
                                  actions: [
                                    TextButton(
                                        child: const Text('Oui'),
                                        onPressed: () async {
                                          _appointmentViewModel
                                              .createAppointment();
                                          int count = 0;
                                          Navigator.popUntil(
                                              context, (_) => count++ >= 3);
                                        }),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'non'),
                                      child: const Text('Non'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: FxText.l1(
                          'CONFIRMER LE RENDEZ-VOUS',
                          color: Colors.white,
                          fontWeight: 800,
                        ),
                      ),
                      FxSpacing.height(15),
                      FxText.l3(
                          'En confirment ce rendez-vous, vous vous engagez à l\'honorer.'),
                      FxSpacing.height(2),
                      FxText.caption(
                          'Pensez bien à l\'annuler le plus tôt possible en cas d\'impévu.')
                    ],
                  ),
                ),
              ),
              FxSpacing.height(23)
            ],
          ),
        ));
  }
}
