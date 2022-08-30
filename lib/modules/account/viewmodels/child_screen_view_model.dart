import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_prof_d/api_json.models.swagger.dart';
import '../repos/account_repo.dart';
import '../models/child_model.dart';

final childViewModelProvider =
    ChangeNotifierProvider<ChildViewModel>((ref) => ChildViewModel(ref));

class ChildViewModel extends ChangeNotifier {
  final Ref ref;
  List<ChildModel> childList = <ChildModel>[];

  ChildViewModel(this.ref);

  Future<List<ChildModel>> getChildList() async {
    print(childList);
    print(childList.isNotEmpty);
    if (childList.isNotEmpty) {
      return childList;
    }

    final resultChildList = await AccountRepo.instance.getChildList();

    List<ChildModel> finalChildList = resultChildList.map((child) {
      return ChildModel.fromJson(child);
    }).toList();
    childList = finalChildList;
    print('finalChildList: $finalChildList');
    return childList;
  }

  void setListChild(AddChildDto newChild) async {
    List<dynamic> childListResult =
        await AccountRepo.instance.addChild(newChild);
    List<ChildModel> finalChildList = childListResult.map((child) {
      return ChildModel.fromJson(child);
    }).toList();
    childList = finalChildList;
    notifyListeners();
  }
}
