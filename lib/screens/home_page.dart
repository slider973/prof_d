import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/profd_field.dart';
import '../widgets/profd_date_time_field.dart';
import '../models/user.dart';
import '../services/user_prof_d/user_profd_bloc.dart';
import '../widgets/place_google_field.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum CivilityCharacter { mrs, mr }

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  CivilityCharacter? _character = CivilityCharacter.mrs;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nameOfBirdController = TextEditingController();
  final TextEditingController _civility = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _dateOfBirthController.dispose();
    _nameOfBirdController.dispose();
    _civility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);

    return FutureBuilder(
        future: userReference.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            initCheckData(data);

            Future.delayed(Duration.zero, () async {
              // Your Function
            });
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 9.0.h),
                    Text(
                      'Formulaire de creation de profile',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 3.0.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text("Civilité"),
                              ),
                              _buildCivilite(),
                            ],
                          ),
                          ProfdField(
                            labelText: "Prénom",
                            controller: _firstnameController,
                          ),
                          ProfdField(
                            labelText: "Nom",
                            controller: _lastnameController,
                          ),
                          ProfdField(
                            labelText: "Nom de naissance",
                            controller: _nameOfBirdController,
                          ),
                          ProfdDateTimeField(
                            labelText: "Date de naissance",
                            controller: _dateOfBirthController,
                          ),
                          const GooglePlaceField(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  UserProfd newUserProfD = createNewProfile();
                  context
                      .read<UserProfdBloc>()
                      .add(UpdateUserProfdEvent(newUserProfD));
                },
                label: const Text('Créer un profile'),
                icon: const Icon(Icons.add),
              ),
            );
          }
//TODO mettre un vrai loader
          return const Text("loading");
        });
  }

void getRadioValueFromString(String value, CivilityCharacter character) {
    for(value in character.) {

    }

}
  void initCheckData(Map<String, dynamic> data) {
    checkData(data, 'firstname', _firstnameController);
    checkData(data, 'dateOfBirth', _dateOfBirthController);
    checkData(data, 'lastname', _lastnameController);
    checkData(data, 'nameOfBirth', _nameOfBirdController);
  }

  void checkData(
      Map<String, dynamic> data, String key, TextEditingController controller) {
    if (key == 'dateOfBirth' &&
        data[key] != null &&
        data[key].toString().isNotEmpty) {
      _dateOfBirthController.text = DateFormat("dd-MM-yyyy").format(
          DateTime.fromMicrosecondsSinceEpoch(
              (data[key] as Timestamp).microsecondsSinceEpoch));
      return;
    }
    if (data[key] != null && data[key].toString().isNotEmpty) {
      controller.text = data[key];
    }
  }

  UserProfd createNewProfile() {
    final newUserProfD = UserProfd();
    newUserProfD.id = FirebaseAuth.instance.currentUser!.uid;
    newUserProfD.firstname = _firstnameController.value.text;
    newUserProfD.lastname = _lastnameController.value.text;
    newUserProfD.email = FirebaseAuth.instance.currentUser!.email!;
    newUserProfD.dateOfBirth =
        DateFormat("dd-MM-yyyy").parse(_dateOfBirthController.text);
    newUserProfD.civility = _character.toString().split('.').last;
    newUserProfD.nameOfBirth = _nameOfBirdController.text;
    return newUserProfD;
  }

  Row _buildCivilite() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<CivilityCharacter>(
                value: CivilityCharacter.mrs,
                groupValue: _character,
                onChanged: (CivilityCharacter? value) {
                  setState(() {
                    _character = value;
                    _civility.text = _character.toString().split('.').last;
                  });
                },
              ),
              const Text('Madame')
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Radio<CivilityCharacter>(
                value: CivilityCharacter.mr,
                groupValue: _character,
                onChanged: (CivilityCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              const Text('Monsieur'),
            ],
          ),
        ),
      ],
    );
  }
}
