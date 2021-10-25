import '../../doctor/widgets/prof_d_field_widget.dart';
import '../../../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../common/ui.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../models/booking_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_appointment_controller.dart';
import 'field_select_adress.dart';
import 'package:lottie/lottie.dart';
import 'field_selected.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class BookingAppointmentView extends GetView<BookingAppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Book an Appointment".tr,
            style: context.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
        ),
        bottomNavigationBar: buildBlockButtonWidget(controller.booking.value),
        body: ListView(
          children: [

            Obx(() {
              return ProdDFieldWidget(
                  title:
                      Text("Your Address".tr, style: Get.textTheme.subtitle2),
                  content: FieldSelectedAddress(
                      addressList: controller.locationOfTheEvent));
            }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   SizedBox(width: 10),
                      Center(
                        child: FlatButton(
                          onPressed: () {
                            controller.showMyDatePicker(context);
                          },
                          shape: StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.2),
                          child: Text("Select a Date".tr,
                              style: Get.textTheme.subtitle1),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.3, height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   child: Text(
                      //       "At What's time you are free in your address?",
                      //       style: Get.textTheme.bodyText1),
                      // ),
                      SizedBox(width: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            controller.showMyTimePicker(context);
                          },
                          style: TextButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor:
                              Get.theme.accentColor.withOpacity(0.2)),
                          child: Text("Select a time".tr,
                              style: Get.textTheme.subtitle1),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
               AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                    0, 0, 0),
                child: Obx(() {
                  return Column(
                    children: [
                      Text("Requested Service on".tr)
                          .paddingSymmetric(vertical: 20),
                      Text(
                          '${DateFormat.yMMMMEEEEd(Get.locale.toString()).format(controller.appointments.value.dateOfStart)}',
                          style: Get.textTheme.headline5),
                      Text(
                          'à ${DateFormat('HH:mm').format(controller.appointments.value.dateOfStart)}',
                          style: Get.textTheme.headline3),
                      Lottie.asset('assets/animation/madame/female-call-center-operator.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ],
                  );
                }),
              )
          ],
        ));
  }

  Widget buildBlockButtonWidget(Booking _booking) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: BlockButtonWidget(
        text: Text(
          "Continue".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6.merge(
            TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        color: Get.theme.accentColor,
        onPressed: () {
          print(_booking);
          //Get.toNamed(Routes.CHECKOUT, arguments: _booking);
        },
        icon: null,
      ).paddingOnly(right: 20, left: 20),
    );
  }
}
