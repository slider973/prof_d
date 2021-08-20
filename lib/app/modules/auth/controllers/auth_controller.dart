import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../validator/register_validator.dart';
import '../../../services/auth_service.dart';
import '../../../../common/ui.dart';

class AuthController extends GetxController {
  final hidePassword = true.obs;
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final checkedMale = false.obs;
  final checkedFeMale = false.obs;
  final selectedDate = DateTime.now().obs;
  final authService = Get.find<AuthService>();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    emailController.text = "Email address".tr;
    passwordController.text = "".tr;
    hidePasswordController.text = "".tr;
    fullNameController.text = "".tr;
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    hidePasswordController.dispose();
    fullNameController.dispose();
    super.onClose();
  }

  void register() async {
    final isRegisterFormValid = RegisterValidator(
            email: emailController.text,
            password: passwordController.text,
            hidePassword: hidePasswordController.text,
            fullName: fullNameController.text)
        .isValid(false);
    if (isRegisterFormValid) {
      try {
        final newUser = User();
        newUser.email = emailController.text;
        newUser.password = passwordController.text;
        newUser.username = emailController.text.split("@")[0];
        newUser.fullName = fullNameController.text;
        newUser.verifiedPhone = true;

        await this.authService.register(newUser);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "unknowError".tr));
        throw new Exception('error');
      }
    }
  }

  void login() async {
    final isLoginFormValid =
        RegisterValidator(email: emailController.text).isValid(true);
    print('toto');
    if (isLoginFormValid) {
      try {
        final user = User();
        user.email = emailController.text;
        user.password = passwordController.text;
        await this.authService.login(user);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "unknowError".tr));
        throw new Exception('error');
      }
    }
  }

  Future<Null> showMyDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value.add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    if (picked != null) {
      selectedDate.update((val) {
        val = DateTime(
            picked.year, picked.month, picked.day, val.hour, val.minute);
      });
    }
  }
}
