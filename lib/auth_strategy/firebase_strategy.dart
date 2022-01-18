import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prof_d/config/config_route_collection.dart';
import 'auth_context.dart';

class FirebaseAuthStrategy implements AuthStrategy {
  @override
  register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      CollectionReference users =
          FirebaseFirestore.instance.collection(userCollection);

      users
          .doc(userCredential.user?.uid)
          .set({
        'email': userCredential.user?.email,
        'isProfileCreated': false
      })
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

  @override
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        return FirebaseAuth.instance.currentUser;
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
