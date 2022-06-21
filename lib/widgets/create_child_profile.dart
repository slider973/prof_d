///Library
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutx/flutx.dart';
import 'package:flutx/widgets/widgets.dart';
import '../models/user_child_prod.dart';
import '../services/child_profd/child_profd_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///widgets
import '../widgets/build_civitily.dart';
import '../modules/home/components/profd_text_field_component.dart';
import '../widgets/profd_date_time_field.dart';
import '../services/user_prof_d/user_profd_bloc.dart';
import '../widgets/place_google_field.dart';
import '../models/user.dart';

enum CreateChildProfileAction { update, create }

class CreateChildProfile extends StatefulWidget {
  final Map<String, dynamic>? data;
  final CreateChildProfileAction action;
  final String? idChild;

  const CreateChildProfile(
      {Key? key, required this.data, required this.action, this.idChild})
      : super(key: key);

  @override
  _CreateChildProfileState createState() => _CreateChildProfileState();
}

class _CreateChildProfileState extends State<CreateChildProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nameOfBirdController = TextEditingController();
  final TextEditingController _cityOfBirdController = TextEditingController();
  final TextEditingController _civilityController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _dateOfBirthController.dispose();
    _nameOfBirdController.dispose();
    _cityOfBirdController.dispose();
    _civilityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      initCheckData(widget.data!);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.action == CreateChildProfileAction.update
                ? SizedBox(height: 4.0.h)
                : FxSpacing.height(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            if (widget.action == CreateChildProfileAction.create)
              Text(
                'Formulaire d\'ajout d\'un enfant',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            else
              Text(
                'Mise à jour de la fiche \n    de l\'enfant '
                '${_firstnameController.text}',
                style: Theme.of(context).textTheme.subtitle1,
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
                  ProfdTextFieldComponent(
                    labelText: "Prénom",
                    controller: _firstnameController,
                  ),
                  ProfdTextFieldComponent(
                    labelText: "Nom",
                    controller: _lastnameController,
                  ),
                  ProfdTextFieldComponent(
                    labelText: "Nom de naissance",
                    controller: _nameOfBirdController,
                  ),
                  ProfdDateTimeField(
                    labelText: "Date de naissance",
                    controller: _dateOfBirthController,
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
          UserChildProfd newUserProfD = buildNewChildObject();
          final eventAction = widget.action == CreateChildProfileAction.create
              ? SetChildProfdEvent(newUserProfD)
              : UpdateChildProfdEvent(widget.idChild!, newUserProfD);

          context.read<ChildProfdBloc>().add(eventAction);
          Navigator.pop(context);
        },
        label: widget.action == CreateChildProfileAction.create
            ? const Text('Ajouter')
            : const Text('Mettre à jour'),
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
  }

  UserChildProfd buildNewChildObject() {
    final newChildUserProfD = UserChildProfd();
    newChildUserProfD.id = widget.idChild ?? '';
    newChildUserProfD.firstname = _firstnameController.value.text;
    newChildUserProfD.lastname = _lastnameController.value.text;
    newChildUserProfD.dateOfBirth =
        DateFormat("dd-MM-yyyy").parse(_dateOfBirthController.text);
    newChildUserProfD.civility = _civilityController.text;
    newChildUserProfD.nameOfBirth = _nameOfBirdController.text;
    newChildUserProfD.cityOfBird = _cityOfBirdController.text;
    return newChildUserProfD;
  }
}
