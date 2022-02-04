import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prof_d/services/appointment_profd/appointment_bloc.dart';
import 'package:prof_d/views/create_events.dart';

class CardProfDContainer extends StatelessWidget {
  CardProfDContainer({
    Key? key,
  }) : super(key: key);

  final Stream<QuerySnapshot> availableSlotsListStream = FirebaseFirestore
      .instance
      .collection('slots-available')
      .where('booked', isEqualTo: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: availableSlotsListStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Container(
          color: Colors.grey[300],
          child: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(DateFormat("yMMMMEEEEd", 'fr_FR').format(
                            DateTime.fromMicrosecondsSinceEpoch(
                                (data['date'] as Timestamp)
                                    .microsecondsSinceEpoch))),
                      ),
                      SizedBox(
                        height: 30.0,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data['slots'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  child: Text(
                                    DateFormat("Hm").format(
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          (data['slots'][index] as Timestamp)
                                              .microsecondsSinceEpoch),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            MultiBlocProvider(
                                          providers: [
                                            BlocProvider<AppointmentBloc>(
                                                create: (context) =>
                                                    AppointmentBloc())
                                          ],
                                          child: CreateEvents(
                                            dateSelected: DateTime.fromMicrosecondsSinceEpoch(
                                                (data['date'] as Timestamp)
                                                    .microsecondsSinceEpoch),
                                            slotSelected: DateTime.fromMicrosecondsSinceEpoch(
                                                (data['slots'][index] as Timestamp)
                                                    .microsecondsSinceEpoch),
                                          ),
                                        ),
                                        transitionDuration:
                                            const Duration(milliseconds: 300),
                                        transitionsBuilder: (_, animation, __,
                                                child) =>
                                            SlideTransition(
                                                position: Tween<Offset>(
                                                        begin:
                                                            const Offset(0, 1),
                                                        end: Offset.zero)
                                                    .animate(animation),
                                                child: child),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor:
                                          Theme.of(context).primaryColor),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
