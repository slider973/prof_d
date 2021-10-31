import 'package:prof_b/app/models/api/Appointments.dart';
import 'package:prof_b/app/models/api/slotAppointments.dart';

import '../../../models/address_model.dart';
import '../../../repositories/booking_repository.dart';
import '../../../../common/ui.dart';

import '../../../models/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class BookingAppointmentController extends GetxController {
  BookingRepository _bookingRepository;
  final scheduled = false.obs;
  final Rx<Booking> booking = Booking().obs;
  final Rx<Appointments> appointments = Appointments().obs;
  final RxList<Address> locationOfTheEvent = [Address()].obs;

  get currentAddress => Get.find<AuthService>().address.value;

  BookingAppointmentController() {
    _bookingRepository = new BookingRepository();
  }

  Future<void> getAdresses({bool showMessage = false}) async {
    locationOfTheEvent
        .assignAll(await _bookingRepository.getAddressesToBookings());
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Booking page refreshed successfully".tr));
    }
  }

  @override
  void onInit() async {
    this.appointments.value = Appointments(
      usersPermissionsUser: Get.find<AuthService>().user.value.username,
      dateOfStart: DateTime.now(),
      dateOfEnd: DateTime.now().add(Duration(hours: 1))
    );
    this.booking.value = Booking(
      dateTime: DateTime.now(),
      address: Get.find<AuthService>().address.value,
      appointments: Get.find<AuthService>().user.value.appointments,
      user: Get.find<AuthService>().user.value,
    );
    await this.getAdresses();
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
      print(picked);
      appointments.update((val) {
        val.dateOfStart = picked;
      });
      print(appointments.value.dateOfStart);
      // booking.update((val) {
      //   val.dateTime = DateTime(picked.year, picked.month, picked.day,
      //       val.dateTime.hour, val.dateTime.minute);
      // });
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
      print(picked);
      appointments.update((val) {
        val.dateOfStart = DateTime(appointments.value.dateOfStart.year, appointments.value.dateOfStart.month, appointments.value.dateOfStart.day).add(Duration(minutes: picked.minute , hours:  picked.hour * 60));
      });
      print(appointments.value.dateOfStart);
      // booking.update((val) {
      //   val.dateTime = DateTime(booking.value.dateTime.year,
      //           booking.value.dateTime.month, booking.value.dateTime.day)
      //       .add(Duration(minutes: picked.minute + picked.hour * 60));
      // });
    }
  }
}
