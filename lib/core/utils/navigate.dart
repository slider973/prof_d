import 'package:flutter/material.dart';

import 'routes.dart';

import '../services/navigation_service.dart';

class NavigateUtils {
  NavigateUtils._();
  static final instance = NavigateUtils._();
  navigationToHomeScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.home,
    );
  }
  navigationToIntroductionScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.introduceScreen,
    );
  }
  navigationToRegisterScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.register,
    );
  }
  navigationToLoginScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.authLogin,
    );
  }
  navigationFromTheBottomAnimation(BuildContext context, page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
        const SizedBox.shrink(),
        transitionDuration:
        const Duration(
            milliseconds: 300),
        transitionsBuilder: (_,
            animation, __, child) =>
            SlideTransition(
                position: Tween<Offset>(
                    begin:
                    const Offset(
                        0, 1),
                    end:
                    Offset.zero)
                    .animate(animation),
                child: child),
      ),
    );
  }

}