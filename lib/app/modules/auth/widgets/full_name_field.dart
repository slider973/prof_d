import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../doctor/widgets/doctor_til_widget.dart';
import '../../../../common/ui.dart';

DoctorTilWidget fullNameField(AuthController controller) {
  return DoctorTilWidget(
    title: Text("FullName".tr, style: Get.textTheme.subtitle2),
    content: TextFormField(
      controller: controller.fullNameController,
      style: Get.textTheme.caption,
      decoration: Ui.getInputDecoration(
        hintText: "Elon musk",
        iconData: Icons.account_circle,
      ),
    ),
  );
}