import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../doctor/widgets/doctor_til_widget.dart';
import '../../../../common/ui.dart';

DoctorTilWidget phoneNumberField() {
  return DoctorTilWidget(
    title: Text("Phone Number".tr, style: Get.textTheme.subtitle2),
    content: TextFormField(
      initialValue: "".tr,
      style: Get.textTheme.caption,
      keyboardType: TextInputType.number,
      decoration: Ui.getInputDecoration(
        hintText: "+1 223 665 7896".tr,
        iconData: Icons.phone_android_outlined,
      ),
    ),
  );
}