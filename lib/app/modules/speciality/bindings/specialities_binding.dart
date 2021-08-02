import '../controllers/specialities_controller.dart';
import 'package:get/get.dart';

class SpecialitiesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SpecialitiesController>(
          () => SpecialitiesController(),
    );
  }

}