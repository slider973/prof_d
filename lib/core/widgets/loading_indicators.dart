import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles/app_images.dart';
import '../styles/sizes.dart';


class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget smallLoadingAnimation(
      BuildContext context, {
        double? height,
        double? width,
      }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          AppImages.loadingAnimation,
          height: height ?? Sizes.loadingAnimationDefaultHeight,
          width: width ?? Sizes.loadingAnimationDefaultWidth,
        ),
      ),
    );
  }
}
