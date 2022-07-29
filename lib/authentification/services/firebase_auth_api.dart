import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../core/utils/dialogs.dart';
import '../models/user_model.dart';

class FirebaseAuthAPI {
  FirebaseAuthAPI._();

  static final FirebaseAuthAPI instance = FirebaseAuthAPI._();

  UserCredential? userCredential;

  Future<UserModel?>? signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {
      debugPrint(userCredential.toString());
      return null;
    } else {
      AppDialogs.showDefaultErrorDialog();
      return null;
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
