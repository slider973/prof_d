import '../../alarm/controllers/alarms_controller.dart';
import '../../booking/controllers/bookings_controller.dart';
import '../../messages/controllers/messages_controller.dart';
import '../../notifications/controllers/notifications_controller.dart';
import '../../../widgets/tab_bar_widget.dart';
import '../../home/controllers/home_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../controllers/tabs_controller_.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
            () => TabsController()
    );
    Get.lazyPut<HomeController>(
            () => HomeController()
    );
    Get.lazyPut<SearchController>(
            () => SearchController()
    );

    Get.lazyPut<NotificationsController>(
            () => NotificationsController()
    );

    Get.lazyPut<MessagesController>(
            () => MessagesController()
    );
    Get.lazyPut<AlarmsController>(
            () => AlarmsController()
    );
    Get.lazyPut<TabBarController>(
          () => TabBarController(),
    );

    Get.lazyPut<BookingsController>(
          () => BookingsController(),
    );

  }
}