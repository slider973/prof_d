
import 'package:flutter/material.dart';

import '../controllers/alarms_controller.dart';
import 'package:flutter/cupertino.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;

class FrequenciesWidget extends GetWidget<AlarmsController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: Get.width,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx((){
              return Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
                    margin: EdgeInsets.only(left: 20,top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Get.theme.focusColor.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5)),
                        ],
                        border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
                    child: Center(child:Text('${DateFormat('HH:mm').format(controller.alarm.value.add_frequencies)}'))
                ),
              );
            }),
            MaterialButton(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                elevation: 0,
                onPressed: () {
                  controller.showMyTimePicker(context);
                },
                shape: StadiumBorder(),
                color: Get.theme.accentColor.withOpacity(0.2),
                child: Icon(Icons.timelapse_outlined,color: Get.theme.primaryColor,)
            ).paddingOnly(top: 0, bottom: 0, right: 22, left: 22),
          ],
        ),
    );
  }

}
