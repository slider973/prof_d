import 'package:get/get.dart';
import '../../../../common/ui.dart';
import 'package:validators/validators.dart';

class RegisterValidator {
  var _email = null;
  var _password = null;
  var _hidePassword = null;

  RegisterValidator({String email, String password, String hidePassword}) {
    _email = email;
    _password = password;
    _hidePassword = hidePassword;
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

  isValid() {
    try {
      email_validate();
      password_validate();
      return true;
    } catch (e) {
      return false;
    }
  }
}
