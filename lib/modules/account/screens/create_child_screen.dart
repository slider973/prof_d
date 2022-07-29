import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/styles/sizes.dart';
import '../../../widgets/profd_date_time_field.dart';
import '../../home/components/profd_text_field_component.dart';
import '../../home/components/profd_text_area_field.dart';
import '../viewmodels/create_child_view_model.dart';

class CreateChildScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  CreateChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final createChildVM = ref.watch(createChildViewModel.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            createChildVM.addChildToParent(context);
            Navigator.pop(context);
          }
        },
        label: const Text('Ajouter'),
        icon: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const Text("Formulaire d'ajout d'un enfant"),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProfdTextFieldComponent(
                      labelText: "Prénom",
                      controller: createChildVM.firstnameController,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Nom",
                      controller: createChildVM.lastnameController,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Nom de naissance",
                      controller: createChildVM.nameOfBirthController,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Nombre de frere et soeur",
                      controller: createChildVM.numberOfBrotherAndSister,
                    ),
                    ProfdDateTimeField(
                      labelText: "Date de naissance",
                      controller: createChildVM.dateOfBirthController,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Place dans la fraterie",
                      controller: createChildVM.placeInTheSiblingGroup,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Lieu de scolarisation",
                      controller: createChildVM.placeOfSchooling,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "En classe de",
                      controller: createChildVM.classLevel,
                    ),
                    ProfdTextFieldComponent(
                      labelText: "Suivis en cours",
                      controller: createChildVM.followUpsInProgress,
                    ),
                    ProfTextAreaField(
                      labelText: "Troubles et/ou difficultés repérés",
                      controller:
                          createChildVM.identifiedDisordersAndOrDifficulties,
                    ),
                    ProfTextAreaField(
                      labelText: "Aménagements mis en place dans la classe",
                      controller: createChildVM.arrangementsInTheClassroom,
                    ),
                    ProfTextAreaField(
                      labelText:
                          "Comportement au domicile (si rien de particulier indiquez RAS)",
                      controller: createChildVM.behaviourInTheHome,
                    ),
                    SizedBox(
                      height: Sizes.hMarginExtreme,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
