import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../card_time_table.dart';
import '../../../../viewmodel/home_viewmodel.dart';

class CardTimeTableListSection extends ConsumerWidget {
  const CardTimeTableListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeTableList = ref.watch(homeViewModelViewModelProvider.notifier);
    return Expanded(
        child: Container(
      color: Colors.grey[300],
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (ConnectionState.active != null && !snapshot.hasData) {
            return const Center(child: Text('Loading'));
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
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 9.0, right: 9.0, bottom: 9.0),
                  child: SizedBox(
                      height: 150,
                      child: CarteTimeTableComponent(
                        date: data['date'],
                        slots: data['slots'],
                      )),
                );
              });
        },
        future: timeTableList.getTimeTableAndSlot(),
      ),
    ));
  }
}


