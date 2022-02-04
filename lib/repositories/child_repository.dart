import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_child_prod.dart';
import '../config/config_route_collection.dart';
import '../models/user.dart';

class ChildRepository {
  static addChildToUserDoc(UserChildProfd child)  {
        CollectionReference childRef =
    FirebaseFirestore.instance.collection('users');
    childRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(childCollection)
        .add(child.toMap() as Map<String, dynamic>)
        .then((value) => print("Child Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static updateChildToUserDoc(String id, UserChildProfd child)  {
    CollectionReference childRef =
    FirebaseFirestore.instance.collection('users');
    childRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(childCollection)
        .doc(id)
        .update(child.toMap() as Map<String, Object?>)
        .then((value) => print("Child Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}