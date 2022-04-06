import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/styles/sizes.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../components/animation_component.dart';
import '../components/button_component.dart';
import '../components/dashboard/dashboard_component.dart';
import '../components/divider_component.dart';
import '../components/not_profile_list_component.dart';
import '../components/text_profile_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();

    if (_userModel!.isProfileCreated != null &&
        _userModel.isProfileCreated == true) {
      return const DashboardComponent();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: notProfileListComponent(),
    );

  }
}
