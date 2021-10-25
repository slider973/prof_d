
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../../common/ui.dart';
import '../../doctor/widgets/prof_d_field_widget.dart';

Obx passwordField(BuildContext context, AuthController controller) {
  return Obx(() {
    return ProdDFieldWidget(
      title: Text("Password".tr, style: Get.textTheme.subtitle2),
      content: TextFormField(
        controller: controller.passwordController,
        obscureText: !controller.hidePassword.value,
        style: Get.textTheme.caption,
        decoration: Ui.getInputDecoration(
          hintText: "••••••••••••".tr,
          iconData: Icons.lock_outline,
          suffixIcon: IconButton(
            onPressed: () {
              controller.hidePassword.value = !controller.hidePassword.value;
            },
            color: Theme.of(context).focusColor,
            icon: Icon(controller.hidePassword.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
          ),
        ),
      ),
    );
  });
}