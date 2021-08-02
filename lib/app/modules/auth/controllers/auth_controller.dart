import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{

  final hidePassword = true.obs;
  final checkedMale = false.obs;
  final checkedFeMale = false.obs;
  final selectedDate=DateTime.now().obs;

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
        val= DateTime(picked.year, picked.month, picked.day, val.hour, val.minute);
      });
    }
  }
}