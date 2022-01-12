///Library
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
///widgets
import '../widgets/profd_field_phone.dart';
import '../widgets/build_civitily.dart';
import '../widgets/profd_field.dart';
import '../widgets/profd_date_time_field.dart';
import '../services/user_prof_d/user_profd_bloc.dart';
import '../widgets/place_google_field.dart';
import '../models/user.dart';



class CreateProfile extends StatefulWidget {
  final Map<String, dynamic>? data;

  const CreateProfile({Key? key, required this.data}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nameOfBirdController = TextEditingController();
  final TextEditingController _cityOfBirdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _civilityController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _dateOfBirthController.dispose();
    _nameOfBirdController.dispose();
    _cityOfBirdController.dispose();
    _civilityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.data != null) {
      initCheckData(widget.data!);
    }


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
                      BuildCivitily(
                        controller: _civilityController,
                      ),
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
                  ProfdFieldPhone(
                    labelText: "Téléphone",
                    controller: _phoneController,
                  ),
                  GooglePlaceField(
                    controller: _cityOfBirdController,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          UserProfd newUserProfD = createNewProfile();
          context.read<UserProfdBloc>().add(UpdateUserProfdEvent(newUserProfD));
        },
        label: const Text('Créer un profile'),
        icon: const Icon(Icons.add),
      ),
    );
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

  void initCheckData(Map<String, dynamic> data) {
    checkData(data, 'firstname', _firstnameController);
    checkData(data, 'dateOfBirth', _dateOfBirthController);
    checkData(data, 'lastname', _lastnameController);
    checkData(data, 'nameOfBirth', _nameOfBirdController);
    checkData(data, 'cityOfBird', _cityOfBirdController);
    checkData(data, 'civility', _civilityController);
    checkData(data, 'phone', _phoneController);
  }

  UserProfd createNewProfile() {
    final newUserProfD = UserProfd();
    newUserProfD.id = FirebaseAuth.instance.currentUser!.uid;
    newUserProfD.firstname = _firstnameController.value.text;
    newUserProfD.lastname = _lastnameController.value.text;
    newUserProfD.email = FirebaseAuth.instance.currentUser!.email!;
    newUserProfD.dateOfBirth =
        DateFormat("dd-MM-yyyy").parse(_dateOfBirthController.text);
    newUserProfD.civility = _civilityController.text;
    newUserProfD.nameOfBirth = _nameOfBirdController.text;
    newUserProfD.cityOfBird = _cityOfBirdController.text;
    newUserProfD.phone = _phoneController.text;
    return newUserProfD;
  }
}
