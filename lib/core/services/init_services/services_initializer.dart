import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'connectivity_service.dart';
import 'firebase_messaging_service.dart';
import 'history_service.dart';
import 'local_notification_service.dart';
import 'theme_service.dart';

import '../../localization/app_localization.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  initializeSettings() async {
    //This method is used to initialize any service before the app runs (in main method)
    List futures = [
      initializeLocalization(),
      initializeScreensOrientation(),
    ];

    if (!kIsWeb) {
      final settingList = [
        initHistoryService(),
        initializeConnectivity(),
        initializeNotificationSettings(),
        initializeFirebase(),
      ];
      for (var setting in settingList) {
        futures.add(setting);
      }
    }
    List<dynamic> result = await Future.wait([...futures]);
    return result;
  }

  initializeLocalization() async {
    return await AppLocalizations.instance.getUserStoredLocale();
  }

  initializeTheme() async {
    return await ThemeService.instance.getUserStoredTheme();
  }

  initializeConnectivity() async {
    ConnectivityService.instance.initializeConnectivityListeners();
  }

  initializeNotificationSettings() async {
    await LocalNotificationService.instance.initNotificationSettings();
  }

  initializeFirebase() async {
    await Firebase.initializeApp();
    await initializeFirebaseMessaging();
  }

  initializeFirebaseMessaging() async {
    await FirebaseMessagingService.instance.initFirebaseMessaging();
  }

  initHistoryService() async {
    await HistoryService.instance.initialize();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  Future initializeData() async {
    List futures = [
      cacheDefaultImages(),
    ];
    List<dynamic> result = await Future.wait<dynamic>([...futures]);
    return result;
  }

  cacheDefaultImages() async {
    // precacheImage(const AssetImage(AppImages.appLogoIcon), Get.context!);
    // precacheImage(const AssetImage(AppImages.splash), Get.context!);
  }
}
