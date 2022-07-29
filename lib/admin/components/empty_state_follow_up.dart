import 'package:flutter/material.dart';

import '../models/child.dart';
import '../viewmodels/create_follow_up_viewmodel.dart';
import '../viewmodels/following_viewmodel.dart';

class EmptyStateFollowUp extends StatelessWidget {
  const EmptyStateFollowUp({
    Key? key,
    required this.followingVM,
    required this.createFollowUpVM,
    required this.childSelected,
  }) : super(key: key);

  final FollowingViewModel followingVM;
  final CreateFollowUpViewModel createFollowUpVM;
  final Child childSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildMakeAppointmentAgainButton(
            () {
          followingVM.goCreateFollowUp(context);
          createFollowUpVM.setChild(childSelected.id);
        },
      ),
    );
  }
}

ElevatedButton _buildMakeAppointmentAgainButton(cb) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: const StadiumBorder(),
        elevation: 0),
    onPressed: () {
      cb();
    },
    child: const Text(
      'Commencer a suivre',
      style: TextStyle(height: 1.0, fontSize: 12),
    ),
  );
}
