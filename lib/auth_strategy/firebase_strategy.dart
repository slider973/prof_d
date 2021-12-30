import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_context.dart';

class FirebaseAuthStrategy implements AuthStrategy {
  @override
  register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .add({'displayName': userCredential.user?.displayName})
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }
}
