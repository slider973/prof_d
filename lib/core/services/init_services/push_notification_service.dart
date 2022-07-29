import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  PushNotificationService._();

  static final instance = PushNotificationService._();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initPushNotificationSettings() async {
    await _getToken();
  }

  _getToken() async {
    final token = await messaging.getToken();
    return token;
  }
}
