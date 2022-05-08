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

  navigationToPageScreen(page) {
    NavigationService.navigateTo(
      isNamed: false,
      page: page,
      navigationMethod: NavigationMethod.push,
    );
  }
  navigationToIntroductionScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.introduceScreen,
    );
  }

  navigationToAdminScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.admin,
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
        page,
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