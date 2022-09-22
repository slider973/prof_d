///Library
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/styles/sizes.dart';

import '../../../widgets/address_fled.dart';
///widgets
import '../../../widgets/profd_field_phone.dart';
import '../../../widgets/build_civitily.dart';

import '../viewmodel/create_profile_form_viewmodel.dart';
import '../components/profd_text_field_component.dart';
import '../../../widgets/profd_date_time_field.dart';
import '../../../widgets/place_google_field.dart';

class CreateProfileScreen extends ConsumerWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final createProfileMV = ref.watch(createProfileViewModelProvider.notifier);

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            padding: EdgeInsets.symmetric(
              vertical: Sizes.screenVPaddingHigh,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Formulaire de création de profil',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: Sizes.vMarginHigh),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text("Civilité"),
                          ),
                          BuildCivitily(
                            controller: createProfileMV.civilityController,
                          ),
                        ],
                      ),
                      Row(
                          children: const <Widget>[
                            Expanded(
                                child: Divider()
                            ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Information"),
                            ),

                            Expanded(
                                child: Divider()
                            ),
                          ]
                      ),
                      ProfdTextFieldComponent(
                        labelText: "Prénom",
                        controller: createProfileMV.firstnameController,
                      ),
                      ProfdTextFieldComponent(
                        labelText: "Nom",
                        controller: createProfileMV.lastnameController,
                      ),
                      ProfdDateTimeField(
                        labelText: "Date de naissance",
                        controller: createProfileMV.dateOfBirthController,
                      ),
                      ProfdFieldPhone(
                        labelText: "Téléphone",
                        controller: createProfileMV.phoneController,
                      ),

                      GooglePlaceField(
                        controller: createProfileMV.cityOfBirdController,
                      ),
                      Row(
                          children: const <Widget>[
                            Expanded(
                                child: Divider()
                            ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Adresse"),
                            ),

                            Expanded(
                                child: Divider()
                            ),
                          ]
                      ),
                      AddressField(
                        controller: createProfileMV.addressController,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              createProfileMV.sendData(context);
            }
          },
          label: const Text('Créer un profil'),
          icon: const Icon(Icons.add),
        ));
  }
}
