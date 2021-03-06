import '../../booking/views/bookings_view.dart';
import '../../alarm/views/alarms_view.dart';
import '../../messages/views/messages_view.dart';
import '../../account/views/account_view.dart';
import '../../home/views/home_view.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController{
  final currentIndex = 0.obs;

  @override
  void onInit(){
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
  }

  List<Widget> pages = [
    HomeView(),
    BookingsView(),
    AlarmsView(),
    AccountView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /// change page in route

  void changePageInRoot(int _index) {
    currentIndex.value = _index;
  }

  void changePageOutRoot(int _index) {
    currentIndex.value = _index;
    Get.offNamedUntil(Routes.TABS, (Route route) {
      if (route.settings.name == Routes.TABS) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  void changePage(int _index) {
    if (Get.currentRoute == Routes.TABS) {
      changePageInRoot(_index);
    } else {
      changePageOutRoot(_index);
    }
  }
}