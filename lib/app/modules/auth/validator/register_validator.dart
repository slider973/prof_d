import 'package:get/get.dart';
import '../../../../common/ui.dart';
import 'package:validators/validators.dart';

class RegisterValidator {
  var _email = null;
  var _password = null;
  var _hidePassword = null;
  var _fullName = null;

  RegisterValidator({String email, String password, String hidePassword, String fullName}) {
    _email = email;
    _password = password;
    _hidePassword = hidePassword;
    _fullName = fullName;
  }

  email_validate() {
    if (isEmail(_email)) {
      return true;
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Error_email".tr));
      throw false;
    }
  }

  password_validate() {
    if (_password == _hidePassword) {
      return true;
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Password_to_same".tr));
      throw false;
    }
  }

  full_name_validate() {
    if (!_fullName.isEmpty) {
      return true;
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "full_name_empty".tr));
      throw false;
    }
  }

  isValid() {
    try {
      email_validate();
      password_validate();
      full_name_validate();
      return true;
    } catch (e) {
      return false;
    }
  }
}
