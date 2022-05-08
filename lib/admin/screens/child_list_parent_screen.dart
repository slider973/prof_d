import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/child.dart';
import '../viewmodels/dahsboard_viewmodel.dart';

class ChildListParentScreen extends ConsumerWidget {
  final List<Child> childList;

  const ChildListParentScreen({Key? key, required this.childList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _adminDashboardVM = ref.watch(adminDashboardModelViewProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des enfants'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: childList.length,
        itemBuilder: (BuildContext context, int index) {
          final Child child = childList[index];
          return ListTile(
            title: Text('${child.firstname} ${child.lastname}'),
            onTap: (){
              _adminDashboardVM.navigateToChildSelectedScreen(child);
            },
          );
        },
      ),
    );
  }
}
