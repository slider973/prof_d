import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/user.dart';
final createProfileViewModel = ChangeNotifierProvider<CreateProfileFormViewModel>((ref) => CreateProfileFormViewModel(ref));
class CreateProfileFormViewModel extends ChangeNotifier {
  final Ref ref;
  
  
  CreateProfileFormViewModel(this.ref);

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nameOfBirdController = TextEditingController();
  final TextEditingController cityOfBirdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController civilityController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void checkData(
      Map<String, dynamic> data, String key, TextEditingController controller) {
    if (key == 'dateOfBirth' &&
        data[key] != null &&
        data[key].toString().isNotEmpty) {
      dateOfBirthController.text = DateFormat("dd-MM-yyyy").format(
          DateTime.fromMicrosecondsSinceEpoch(
              (data[key]).microsecondsSinceEpoch));
      return;
    }
    if (data[key] != null && data[key].toString().isNotEmpty) {
      controller.text = data[key];
    }
  }

  void initCheckData(Map<String, dynamic> data) {
    checkData(data, 'firstname', firstnameController);
    checkData(data, 'dateOfBirth', dateOfBirthController);
    checkData(data, 'lastname', lastnameController);
    checkData(data, 'nameOfBirth', nameOfBirdController);
    checkData(data, 'cityOfBird', cityOfBirdController);
    checkData(data, 'civility', civilityController);
    checkData(data, 'phone', phoneController);
    checkData(data, 'image', imageController);
  }

  UserProfd buildNewProfileObject() {
    final newUserProfD = UserProfd();
    newUserProfD.firstname = firstnameController.value.text;
    newUserProfD.lastname = lastnameController.value.text;
    newUserProfD.civility = civilityController.text;
    newUserProfD.nameOfBirth = nameOfBirdController.text;
    newUserProfD.cityOfBird = cityOfBirdController.text;
    newUserProfD.phone = phoneController.text;
    newUserProfD.image = imageController.text;
    return newUserProfD;
  }

  sendData(BuildContext context) {
    removeAllFocus(context);
    final user = buildNewProfileObject();
    debugPrint(user.toString());
  }

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }




}

