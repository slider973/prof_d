import 'package:flutter/material.dart';

import '../../../repositories/alarm_repository.dart';
import '../../../models/alarm_model.dart';
import 'package:get/get.dart';
import '../../../../common/ui.dart';

class AlarmsController extends GetxController {
  final alarms = List<Alarm>(0).obs;
  final Rx<Alarm> alarm = Alarm().obs;
  AlarmRepository _alarmRepository;

  AlarmsController() {
    _alarmRepository = new AlarmRepository();
  }

  @override
  void onInit() async {
    await refreshAlarms();
    this.alarm.value=Alarm(
      start_from:new DateTime.now(),
      end_at:new DateTime.now(),
      add_frequencies: new DateTime.now()
    );
    super.onInit();
  }

  Future refreshAlarms({bool showMessage}) async {
    await getAlarms();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of alarms refreshed successfully".tr));
    }
  }

  Future getAlarms() async {
    try {
      alarms.value = await _alarmRepository.getAll();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future<Null> showMyDatePicker(BuildContext context ,DateTime date ,int id) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date.add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    if (picked != null&&id==0) {
      alarm.update((val) {
        val.start_from = DateTime(picked.year, picked.month, picked.day, date.hour, date.minute);
      });
    }else{
      alarm.update((val) {
        val.end_at = DateTime(picked.year, picked.month, picked.day, date.hour, date.minute);
      });

    }
  }

  Future<Null> showMyTimePicker(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(alarm.value.add_frequencies),
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    if (picked != null) {
      alarm.update((val) {
        val.add_frequencies = DateTime(alarm.value.add_frequencies.year, alarm.value.add_frequencies.month, alarm.value.add_frequencies.day)
            .add(Duration(minutes: picked.minute + picked.hour * 60));
      });
    }
  }
}
