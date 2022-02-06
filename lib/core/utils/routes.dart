import 'package:flutter/material.dart';
import '../../screens/auth/login_page_new.dart';
import '../../widgets/splash_screen.dart';
import '../screens/no_internet_connection_screen.dart';

class RoutePaths {
  static const coreSplash = '/';
  static const coreNoInternet = '/no_internet';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const settingsLanguage = '/settings/language';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    //Core
      case RoutePaths.coreSplash:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
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



      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
