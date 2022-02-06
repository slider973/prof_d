import 'package:get/get.dart';

import '../localization/en.dart';
import '../localization/fr.dart';


class LanguageTranslation extends Translations {
  Map<String, String> en = coreEn;
  Map<String, String> fr = coreFr;

  LanguageTranslation() {
    en;

  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'fr': fr,
  };
}
