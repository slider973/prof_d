import 'package:prof_b/app/widgets/tab_bar_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/circular_loading_widget.dart';
import '../widgets/alarm_item_widget.dart';

import '../controllers/alarms_controller.dart';

class AlarmsView extends GetView<AlarmsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Get.theme.hintColor),
        title: Text(
          "Alarms".tr,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Get.theme.hintColor),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        actions: [NotificationsButtonWidget()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshAlarms(showMessage: true);
        },
        child: ListView(
          primary: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Your Alarms".tr, style: Get.textTheme.headline5
                ).paddingSymmetric(horizontal: 22, vertical: 0),
                MaterialButton(
                    //padding: EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                    elevation: 0,
                    onPressed: () {
                      Get.toNamed(Routes.ALARM);
                    },
                    shape: StadiumBorder(),
                    color: Get.theme.accentColor.withOpacity(0.2),
                    child: Text("add new alarm",style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.accentColor)))
                ).paddingSymmetric(horizontal: 22, vertical: 0),
              ],
            ),

            Text(
                "Swipe item left to delete it. | press on item to select it.".tr,
                style: Get.textTheme.caption
            ).paddingSymmetric(horizontal: 22, vertical: 10),
            //Text(".".tr, style: Get.textTheme.caption).paddingSymmetric(horizontal: 22, vertical: 5),
            alarmsList(),
          ],
        ),
      ),
    );
  }

  Widget alarmsList() {
    return Obx(() {
      if (!controller.alarms.isNotEmpty) {
        return CircularLoadingWidget(
          height: 200,
          onCompleteText: "Alarms List is Empty".tr,
        );
      } else {
        var _alarms = controller.alarms;
        return ListView.separated(
            itemCount: _alarms.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 7);
            },
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return AlarmItemWidget(
                alarm: controller.alarms.elementAt(index),
                onDismissed: (value) {
                  controller.alarms.removeAt(index);
                },
              );
            });
      }
    });
  }
}
