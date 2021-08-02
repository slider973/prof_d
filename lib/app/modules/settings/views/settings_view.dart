import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/tab_bar_widget.dart';
import '../controllers/settings_controller.dart';
import '../../../routes/app_pages.dart';

class SettingsView extends GetView<SettingsController> {
  final _navigatorKey = Get.nestedKey(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Settings".tr,
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
          bottom: TabBarWidget(
            tabs: [
              ChipWidget(
                text: "Profile".tr,
                id: 0,
                onSelected: (id) {
                  controller.changePage(id);
                },
              ),
              ChipWidget(
                text: "Languages".tr,
                id: 1,
                onSelected: (id) {
                  controller.changePage(id);
                },
              ),
              ChipWidget(
                text: "Theme Mode".tr,
                id: 2,
                onSelected: (id) {
                  controller.changePage(id);
                },
              )
            ],
          )),
      body: WillPopScope(
        onWillPop: () async {
          if (_navigatorKey.currentState.canPop()) {
            _navigatorKey.currentState.pop();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: _navigatorKey,
          initialRoute: Routes.PROFILE,
          onGenerateRoute: controller.onGenerateRoute,
        ),
      ),
    );
  }
}
