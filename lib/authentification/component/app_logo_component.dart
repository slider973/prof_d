import 'package:flutter/material.dart';

import '../../core/localization/app_localization.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';

class AppLogoComponent extends StatelessWidget {
  const AppLogoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(
          AppImages.logo,
          height: Sizes.loginLogoSize,
          width: Sizes.loginLogoSize,
          fit: BoxFit.cover,
          imageAndTitleAlignment: MainAxisAlignment.start,
        ),
        SizedBox(
          height: Sizes.vMarginSmallest,
        ),
        CustomText.h1(
          context,
          'PROFD',
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
