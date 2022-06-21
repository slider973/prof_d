import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/custom_text.dart';
import '../components/patient_section_component.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tableau de board'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.h3(
                        context,
                        'Consultation',
                        alignment: Alignment.center,
                        weight: FontWeight.bold,
                      ),
                      SvgPicture.asset(
                        'assets/image/home_page_image.svg',
                        height: 100,
                      ),
                      CustomText.h6(
                        context,
                        'Vous n\'avez pas de consultation pour vos enfants aujourd\'hui',
                        alignment: Alignment.center,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: const PatientSectionComponent()),
              Container(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText.h3(
                        context,
                        'Mes Factures',
                        alignment: Alignment.center,
                        weight: FontWeight.bold,
                      ),
                      SvgPicture.asset(
                        'assets/images/home/empty_state/invoices.svg',
                        height: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
