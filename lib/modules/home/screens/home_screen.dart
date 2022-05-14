import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../components/dashboard/dashboard_component.dart';
import '../components/not_profile_list_component.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();

    if (_userModel!.isProfileCreated != null &&
        _userModel.isProfileCreated == true) {
      return DashboardComponent(_userModel);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: notProfileListComponent(),
    );

  }
}
