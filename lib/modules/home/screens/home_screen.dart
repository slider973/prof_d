import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/styles/sizes.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../components/animation_component.dart';
import '../components/button_component.dart';
import '../components/divider_component.dart';
import '../components/text_profile_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(mainCoreViewModel.notifier).getCurrentUser();
    final isCreatedProfile = _userModel?.isProfileCreated ?? false;
    final componentToRender = isCreatedProfile
        ? [const SizedBox.shrink()]
        : [
            const AnimationComponent(),
            SizedBox(
              height: Sizes.vMarginHigh,
            ),
            const DividerComponent(),
            SizedBox(
              height: Sizes.vMarginHigh,
            ),
            const TextProfileComponent(),
            SizedBox(
              height: Sizes.vMarginHigh,
            ),
            const CreateProfileButtonComponent()
          ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: componentToRender,
      ),
    );
  }
}
