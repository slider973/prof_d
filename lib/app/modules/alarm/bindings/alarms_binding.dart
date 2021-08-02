import 'package:prof_b/app/widgets/tab_bar_widget.dart';
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
