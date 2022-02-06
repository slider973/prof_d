
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/init_services/history_service.dart';

class AppLocalizations {
  AppLocalizations._();

  static final instance = AppLocalizations._();

  static const String defaultLocal = 'fr';

  /// Change language for the current application
  /// Save current application language in device local storage so that even if app terminated/restarted, the language doesn't change
  changeLocale({required String languageCode}) {
    Get.updateLocale(Locale(languageCode));
    setUserStoredLocale(Get.locale!);
  }

  Future setUserStoredLocale(Locale locale) async {
    await HistoryService.instance.saveData(
      key: 'user_stored_locale',
      value: locale.toString(),
      dataType: DataType.string,
    );
  }

  Future<Locale> getUserStoredLocale() async {
  try {
    String locale = await HistoryService.instance.restoreData(
      key: 'user_stored_locale',
      dataType: DataType.string,
    ) ??
        defaultLocal;
    print('locale $locale');
    return Locale(locale);
  } catch(e) {
    print(e);
    return const Locale('en');
  }
  }

  String getLanguageCode() {
    return Get.locale?.languageCode ?? defaultLocal;
  }

  /// Check if current application language is Arabic for TextDirection
  bool isAr() {
    return Get.locale?.languageCode.toString() == 'ar';
  }
}

String tr(String key) {
  return key.tr;
}
