import '../controllers/alarms_controller.dart';
import '../../../models/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../../../common/ui.dart';

class AlarmItemWidget extends GetWidget<AlarmsController> {
  AlarmItemWidget({Key key, this.alarm, this.onDismissed}) : super(key: key);
  final Alarm alarm;
  final ValueChanged<Alarm> onDismissed;
  @override
  Widget build(BuildContext context) {
    RxBool checked = true.obs;
    return Dismissible(
      key: Key(this.alarm.hashCode.toString()),
      background: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: Ui.getBoxDecoration(color: Colors.red),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        onDismissed(this.alarm);
        // Then show a snackbar
        Get.showSnackbar(
            Ui.SuccessSnackBar(message: "The alarm is deleted".tr));
      },
      child: Obx((){
        return GestureDetector(
          onTap: () {
              if(checked.value){
                checked.value=false;
              }else{
                checked.value=true;
              }
          },
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: Ui.getBoxDecoration(color: Get.theme.primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Stack(
                      children: <Widget>[
                         Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: !checked.value
                                    ? LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                            Get.theme.focusColor.withOpacity(1),
                                            Get.theme.focusColor.withOpacity(0.2),
                                          ])
                                    : LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                            Get.theme.accentColor.withOpacity(1),
                                            Get.theme.accentColor
                                                .withOpacity(0.2),
                                          ])),

                            child: Icon(
                              checked.value?Icons.check:Icons.notifications_outlined,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 30,
                            ),
                          ),
                        Positioned(
                          right: -15,
                          bottom: -30,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(150),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -20,
                          top: -55,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(150),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                          this.alarm.name.tr,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .merge(TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          this.alarm.available.toString().tr+" left".tr,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .merge(TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        this.alarm.frequencies,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('from : '.tr+'${DateFormat.yMMMd().format(this.alarm.start_from)}', style: Get.textTheme.caption),
                          Text('to : '.tr+'${DateFormat.yMMMd().format(this.alarm.end_at)}', style: Get.textTheme.caption),
                        ],
                      )


                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
