import '../../../models/booking_model.dart';
import '../../../models/doctor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class BookDoctorController extends GetxController {
  final scheduled = false.obs;
  final Rx<Booking> booking = Booking().obs;

  get currentAddress => Get.find<AuthService>().address.value;

  @override
  void onInit() {
    this.booking.value = Booking(
      dateTime: DateTime.now(),
      address: Get.find<AuthService>().address.value,
      appointments: Get.find<AuthService>().user.value.appointments,
      user: Get.find<AuthService>().user.value,
    );
    super.onInit();
  }

  void toggleScheduled(value) {
    scheduled.value = value;
  }

  TextStyle getTextTheme(bool selected) {
    if (selected) {
      return Get.textTheme.bodyText2
          .merge(TextStyle(color: Get.theme.primaryColor));
    }
    return Get.textTheme.bodyText2;
  }

  Color getColor(bool selected) {
    if (selected) {
      return Get.theme.accentColor;
    }
    return null;
  }

  Future<Null> showMyDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: booking.value.dateTime.add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    if (picked != null) {
      booking.update((val) {
        val.dateTime = DateTime(picked.year, picked.month, picked.day,
            val.dateTime.hour, val.dateTime.minute);
        ;
      });
    }
  }

  Future<Null> showMyTimePicker(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(booking.value.dateTime),
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    //print(picked);
    if (picked != null) {
      booking.update((val) {
        val.dateTime = DateTime(booking.value.dateTime.year,
                booking.value.dateTime.month, booking.value.dateTime.day)
            .add(Duration(minutes: picked.minute + picked.hour * 60));
      });
    }
  }
}
