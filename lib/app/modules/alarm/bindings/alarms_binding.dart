import 'package:get/get.dart';
import '../controllers/alarms_controller.dart';

class AlarmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlarmsController>(
      () => AlarmsController(),
    );
  }
}
