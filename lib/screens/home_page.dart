import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prof_d/models/user.dart';
import '../widgets/create_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum CivilityCharacter { mrs, mr }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var userReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);


    return StreamBuilder(
        stream: userReference.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const CreateProfile(data: null);
          }

          if (snapshot.connectionState == ConnectionState.active) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            final user = UserProfd();
            user.firstname = data['firstname'];
            user.lastname = data['lastname'];
            return Scaffold(
              body: Center(
                child: Text('Bonjour ${user.firstname} ${user.lastname} '),
              ),
            );
          }
          //TODO mettre un vrai loader
          return const Text("loading");
        });
  }
}

CivilityCharacter getRadioValueFromString(String value) {
  return CivilityCharacter.values
      .where((element) => element.toString().split('.').last == value)
      .last;
}
