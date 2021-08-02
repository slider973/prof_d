import '../../../widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookings_controller.dart';
import '../widgets/bookings_list_widget.dart';

class BookingsView extends GetView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bookings".tr,
            style: Get.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.sort, color: Get.theme.hintColor),
            onPressed: () => {Scaffold.of(context).openDrawer()},
          ),
          actions: [NotificationsButtonWidget()],
        ),
        body:RefreshIndicator(
            onRefresh: () async {
              await controller.getOngoingBookings(showMessage: true);
            },
            child: BookingsListWidget(bookings: controller.ongoingBookings),
          ),
    );
  }
}
