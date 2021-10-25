import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../doctor/widgets/prof_d_field_widget.dart';
import '../../../../common/ui.dart';

ProdDFieldWidget phoneNumberField() {
  return ProdDFieldWidget(
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