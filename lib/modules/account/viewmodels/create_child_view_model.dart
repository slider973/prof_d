import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../api_prof_d/api_json.swagger.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import 'child_screen_view_model.dart';

final createChildViewModel =
    ChangeNotifierProvider.autoDispose<CreateChildViewModel>(
        (ref) => CreateChildViewModel(ref));

class CreateChildViewModel extends ChangeNotifier {
  final Ref ref;
  late ChildViewModel _childVM;
  CreateChildViewModel(this.ref) {
    _childVM = ref.watch(childViewModelProvider);
  }
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController numberOfBrotherAndSister =
      TextEditingController();
  final TextEditingController placeInTheSiblingGroup = TextEditingController();
  final TextEditingController placeOfSchooling = TextEditingController();
  final TextEditingController classLevel = TextEditingController();
  final TextEditingController followUpsInProgress = TextEditingController();
  final TextEditingController identifiedDisordersAndOrDifficulties =
      TextEditingController();
  final TextEditingController arrangementsInTheClassroom =
      TextEditingController();
  final TextEditingController behaviourInTheHome = TextEditingController();

  final TextEditingController nameOfBirthController = TextEditingController();
  final TextEditingController cityOfBirdController = TextEditingController();

  addChildToParent(BuildContext context) {
    removeAllFocus(context);
    final newChild = AddChildDto(
      lastname: lastnameController.text,
      firstname: firstnameController.text,
      dateOfBirth: DateFormat("dd-MM-yyyy").parse(dateOfBirthController.text),
      numberOfBrotherAndSister: double.parse(numberOfBrotherAndSister.text),
      placeInTheSiblingGroup: placeInTheSiblingGroup.text,
      placeOfSchooling: placeOfSchooling.text,
      classLevel: classLevel.text,
      followUpsInProgress: followUpsInProgress.text,
      identifiedDisordersAndOrDifficulties:
          identifiedDisordersAndOrDifficulties.text,
      arrangementsInTheClassroom: arrangementsInTheClassroom.text,
      behaviourInTheHome: behaviourInTheHome.text,
    );

    submitAddChild(newChild);
  }

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future submitAddChild(AddChildDto newChild) async {
    _childVM.setListChild(newChild);
  }
}
