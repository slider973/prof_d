import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environement {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl =>
      dotenv.get('BACKEND_URL', fallback: 'http://localhost:3000');
}
