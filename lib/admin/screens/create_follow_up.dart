import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/create_follow_up_viewmodel.dart';
import '../form/create_follow_up_form.dart';

class CreateFollowUpScreen extends ConsumerWidget {
  const CreateFollowUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createFollowUpVM = ref.watch(createFollowUpViewModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Creation du suivie'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CreateFollowUpForm(),
          _buildMakeAppointmentAgainButton(() {
            createFollowUpVM.submitFollowUp();
          })
        ],
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
      elevation: 0,
    ),
    onPressed: () {
      cb();
    },
    child: const Text(
      'Créer le suivie',
      style: TextStyle(height: 1.0, fontSize: 12),
    ),
  );
}
