import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/parent.dart';
import '../viewmodels/dahsboard_viewmodel.dart';

class PatientListComponent extends ConsumerWidget {
  const PatientListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _adminDashVM = ref.watch(adminDashboardModelViewProvider);
    return FutureBuilder(
        future: _adminDashVM.getParentList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const SizedBox.shrink();
          }
          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Aucun parent d\'inscrit'),
            );
          }
          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final Parent parent = Parent.fromMap(data[index]);
                return ListTile(
                  title: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _adminDashVM.setParent(parent);
                      _adminDashVM.navigateToChildListScreen(parent.childList);
                    },
                    child: Text(
                        '${parent.lastname.toUpperCase()} ${parent.firstname}'),
                  ),
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (kDebugMode) {
                        print('test jojo');
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child:
                          Text(parent.lastname.substring(0, 1).toUpperCase()),
                    ),
                  ),
                );
              });
        });
  }
}
