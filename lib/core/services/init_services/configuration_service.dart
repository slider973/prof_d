import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class ConfigurationService {
  ConfigurationService._();

  static final instance = ConfigurationService._();

  init() async {
    await dotenv.load(fileName: ".env");
  }

  get(String variableName, String fallback) {
    if (kDebugMode) {
      print('start to resolve env $variableName');
    }
    final value = dotenv.get(variableName, fallback: fallback);
    if (kDebugMode) {
      print('value find is: $value');
    }
    return value;
  }
}