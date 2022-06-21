import 'package:flutter/material.dart';

import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_text.dart';

Column headerSection(String text, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.hPaddingSmallest),
            child: CustomText.h2(
              context,
              text,
              alignment: Alignment.centerLeft,
            ),
          )
        ],
      ),
    ],
  );
}
