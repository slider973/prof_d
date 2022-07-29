import 'package:flutter/material.dart';
import '../../authentification/screens/login_screen.dart';
import '../../authentification/screens/register_screen.dart';
import '../../widgets/admin_tab_bar.dart';
import '../../widgets/bottom_tab_bar.dart';
import '../screens/my_custom_introduction_screen.dart';
import '../screens/no_internet_connection_screen.dart';
import '../screens/splash_screen.dart';

class RoutePaths {
  static const coreSplash = '/';
  static const coreNoInternet = '/no_internet';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const admin = '/admin';
  static const introduceScreen = '/introduce_screen';
  static const register = '/register';
  static const profile = '/profile';
  static const settings = '/settings';
  static const settingsLanguage = '/settings/language';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePaths.coreSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreenProfD());
      case RoutePaths.coreNoInternet:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => NoInternetConnection(
            fromSplash: args != null ? args['fromSplash'] : false,
          ),
        );

      //Auth
      case RoutePaths.authLogin:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );

      //Introduce screen
      case RoutePaths.introduceScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MyCustomIntroductionScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );
      //AdminBar Screen
      case RoutePaths.admin:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AdminBottomTabBarController(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );
      case RoutePaths.register:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const BottomTabBarController(),
        );
    }
  }
}
