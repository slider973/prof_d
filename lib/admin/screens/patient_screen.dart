
import 'package:flutter/material.dart';

import '../components/patient_list_component.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des patients'),
        backgroundColor: Theme.of(context).primaryColor
      ),
      body: const PatientListComponent(),
    );
  }
}
