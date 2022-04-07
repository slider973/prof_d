import 'package:flutter/material.dart';

import '../../../../../../authentification/models/user_model.dart';
import '../../../../../../core/styles/sizes.dart';
import '../../../../../../core/widgets/custom_text.dart';

Container headerSection(UserModel? currentUser, BuildContext context) {
  return Container(
    width: Sizes.designHeight,
    height: Sizes.designHeightSmallest,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CustomText.h2(context, 'Bonjour')
        ]),
        SizedBox(
          height: Sizes.vMarginSmallest,
        ),
        Wrap(
          children: [
            CustomText.h3(context, '${currentUser?.firstname}', alignment: Alignment.center,),
          ],
        ),
      ],
    ),

    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
  );
}
