import 'package:flutter/material.dart';

import '../../../../core/styles/app_images.dart';
import '../../../../core/styles/sizes.dart';

AppBar get buildAppBarComponent {
  return AppBar(
    toolbarHeight: Sizes.iconsSizes['s1'],
    centerTitle: true,
    title: Image.asset(
      AppImages.logo,
      height: Sizes.iconsSizes['s2'],
    ),
    elevation: 0,
  );
}