import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../../authentification/repos/user_repo.dart';

class PushNotificationService {
  PushNotificationService._();

  static final instance = PushNotificationService._();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future initPushNotificationSettings() async {
   final tokenPush = await _getToken();
   if (kDebugMode) {
     print('Get token push: $tokenPush');
   }
   if(tokenPush != null) {
     UserRepo.instance.updateUserTokenPush(token: tokenPush);
   }
  }

  _getToken() async {
    final token = await messaging.getToken();
    return token;
  }
}
