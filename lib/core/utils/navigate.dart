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

}