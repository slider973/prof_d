import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:prof_d/widgets/bottom_tab_bar.dart';
import '../models/confirmed.dart';
import '../widgets/field_date_view.dart';
import 'package:provider/src/provider.dart';
import '../models/appointments.dart';
import '../services/appointment_profd/appointment_bloc.dart';
import '../widgets/child_select_radio.dart';
import '../config/config_route_collection.dart';
import 'package:intl/intl.dart' show DateFormat;

class CreateEvents extends StatefulWidget {
  final DateTime slotSelected;
  final DateTime dateSelected;

  const CreateEvents(
      {Key? key, required this.slotSelected, required this.dateSelected})
      : super(key: key);

  @override
  State<CreateEvents> createState() => _CreateEventsState();

  // note: updated as context.ancestorStateOfType is now deprecated
  static _CreateEventsState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CreateEventsState>();
}

class _CreateEventsState extends State<CreateEvents> {
  late Map<String, dynamic> _childSelected;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(userCollection)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(childCollection)
      .snapshots();

  set childSelected(Map<String, dynamic> valueChildSelected) =>
      setState(() => _childSelected = valueChildSelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Réservation'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxSpacing.height(34),
              FxText.l2(
                'Votre rendez-vous n\'est pas confirmé.',
                fontSize: 15,
                fontWeight: 800,
              ),
              FieldDateView(
                day: widget.dateSelected,
                hour: widget.slotSelected,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FxCard.bordered(
                  child: Column(
                    children: [
                      FxText.sh1(
                        'Pour qui prenez-vous ce rendez-vous ?',
                        fontWeight: 700,
                      ),
                      ChildRadioSelect(
                        dataList: snapshot.data!.docs,
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
                                          try {
                                            final newConfirmed =
                                                Confirmed.fromJson({
                                              'start_date':
                                                  DateFormat("yyyy-MM-dd HH:mm")
                                                      .format(
                                                widget.dateSelected.add(
                                                    Duration(
                                                        hours: widget
                                                            .slotSelected.hour,
                                                        minutes: widget
                                                            .slotSelected
                                                            .minute)),
                                              ),
                                              'end_date': DateFormat(
                                                      "yyyy-MM-dd HH:mm")
                                                  .format(widget.dateSelected
                                                      .add(Duration(
                                                          hours: widget
                                                                  .slotSelected
                                                                  .hour +
                                                              1))),
                                              'country': 'fr',
                                              'is_movable': false,
                                              'canceled': true,
                                              'patient': _childSelected
                                            });
                                            context.read<AppointmentBloc>().add(
                                                SetAppointmentCreatedEvent(
                                                    newConfirmed));
                                            int count = 0;
                                            Navigator.of(context).popUntil((_) => count++ >= 2);
                                          } catch (e) {
                                            print(e);
                                          }
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
          );
        },
      ),
    );
  }
}

//${DateFormat('HH:mm').format("")}
// DateFormat.yMMMMEEEEd(Get.locale.toString()).format(controller.appointments.value.dateOfStart)
