import 'package:flutter/material.dart';

import '../../core/localization/app_localization.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/font_styles.dart';
import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';

class WelcomeComponent extends StatelessWidget {
  final String subTitle;
  const WelcomeComponent({Key? key, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText.h2(
              context,
              'BIENVENUE',
              color: AppColors.primaryColor,
              textAlign: TextAlign.start,
            ),
            CustomImage.s3(
              AppImages.hiHand,
              padding: EdgeInsets.only(bottom: Sizes.vPaddingTiny),
            ),
          ],
        ),
        SizedBox(
          height: Sizes.vMarginSmall,
        ),
        CustomText.h4(
          context,
          subTitle,
          color: AppColors.grey,
          weight: FontStyles.fontWeightMedium,
        ),
      ],
    );
  }
}
