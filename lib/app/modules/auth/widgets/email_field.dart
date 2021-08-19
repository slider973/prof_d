import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../doctor/widgets/doctor_til_widget.dart';
import '../../../../common/ui.dart';

DoctorTilWidget emailField(AuthController controller) {
  return DoctorTilWidget(
    title: Text("Email".tr, style: Get.textTheme.subtitle2),
    content: TextFormField(
      controller: controller.emailController,
      style: Get.textTheme.caption,
      decoration: Ui.getInputDecoration(
        hintText: "johndoe@gmail.com".tr,
        iconData: Icons.alternate_email,
      ),
    ),
  );
}