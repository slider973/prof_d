import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../localization/app_localization.dart';
import '../styles/app_images.dart';
import '../styles/font_styles.dart';
import '../viewmodels/splash_viewmodel.dart';
import '../widgets/custom_text.dart';
import 'popup_page.dart';

import '../styles/sizes.dart';

class SplashScreenProfD extends ConsumerStatefulWidget {
  const SplashScreenProfD({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashScreenProfD> {
  final _logoFadeController = FadeInController();
  final _titleFadeController = FadeInController();

  @override
  void initState() {
    _logoFadeController.fadeIn();
    _titleFadeController.fadeIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(splashViewModel.notifier);

    return PopUpPage(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Sizes.screenHeight,
            width: Sizes.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.splash,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  curve: Curves.easeIn,
                  controller: _logoFadeController,
                  child: Lottie.asset(
                    AppImages.splashAnimation,
                    width: Sizes.splashLogoSize,
                  ),
                ),
                SizedBox(
                  height: Sizes.vMarginSmallest,
                ),
                SizedBox(
                  width: Sizes.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        curve: Curves.easeIn,
                        controller: _titleFadeController,
                        duration: const Duration(seconds: 1),
                        child: CustomText.h1(
                          context,
                          'Prof D',
                          weight: FontStyles.fontWeightExtraBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _logoFadeController.dispose();
    _titleFadeController.dispose();
    super.dispose();
  }
}
