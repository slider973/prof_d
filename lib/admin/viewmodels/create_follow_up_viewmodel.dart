import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repos/admin_repo.dart';
import '../../api_prof_d/api_json.models.swagger.dart';

final createFollowUpViewModel = ChangeNotifierProvider.autoDispose<CreateFollowUpViewModel>(
    (ref) => CreateFollowUpViewModel(ref)
);
class CreateFollowUpViewModel  extends ChangeNotifier {
  CreateFollowUpViewModel(AutoDisposeChangeNotifierProviderRef<CreateFollowUpViewModel> this.ref);
  final Ref ref;
  CreateFollowUpDto newFollowUp = CreateFollowUpDto(stateAfter: '', stateBefore: '', child: '');
  String childId = '';
  final AdminRepo _adminRepo = AdminRepo.instance;

  TextEditingController stateBefore =
  TextEditingController(text: "");
  TextEditingController stateAfter =
  TextEditingController(text: "");

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  submitFollowUp(){
    newFollowUp = newFollowUp.copyWith(
      stateAfter: stateAfter.text,
      stateBefore: stateBefore.text
    );

    if(childId.isNotEmpty){
      newFollowUp = newFollowUp.copyWith(
        child: childId
      );
      _adminRepo.sendFollowUp(
        newFollowUp
      );
    }
  }
  setChild(String childId){
    this.childId = childId;
    notifyListeners();
  }
}