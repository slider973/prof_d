import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserRepository {
  static addUserDoc(UserProfd _user)  {
    CollectionReference users =
    FirebaseFirestore.instance.collection('users');

    users
        .doc(_user.id)
        .set(_user.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static updateUserDoc(String id, String keyToUpdate, dynamic data)  {
    CollectionReference users =
    FirebaseFirestore.instance.collection('users');

    users
        .doc(id)
        .update({keyToUpdate: data})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}