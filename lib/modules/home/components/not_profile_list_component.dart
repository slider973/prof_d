import 'package:flutter/cupertino.dart';
import 'text_profile_component.dart';
import '../../../core/styles/sizes.dart';
import 'animation_component.dart';
import 'button_component.dart';
import 'divider_component.dart';

List<Widget> notProfileListComponent() {
  return [
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
}