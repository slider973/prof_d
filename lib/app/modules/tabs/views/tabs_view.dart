import '../controllers/tabs_controller_.dart';
import '../../../widgets/custom_bottom_navigation_bar.dart';
import '../../../widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TabsView extends GetView<TabsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: Drawer(
          child: MainDrawerWidget(),
          elevation: 0,
        ),
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.accentColor,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePageInRoot(index);
          },
          children: [
            CustomBottomNavigationItem(
                icon: Icons.dashboard_outlined,
                label: "Home".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.dashboard_outlined,
                label: "Home".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.assignment_outlined,
                label: "Booking".tr,
                color: Get.theme.accentColor),
            // CustomBottomNavigationItem(
            //     icon: Icons.message_outlined,
            //     label: "Chats".tr,
            //     color: Get.theme.accentColor),
            // CustomBottomNavigationItem(
            //     icon: Icons.alarm_on_outlined,
            //     label: "Alarms".tr,
            //     color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.person_outline,
                label: "Account".tr,
                color: Get.theme.accentColor),
          ],
        ),
      );
    });
  }
}
