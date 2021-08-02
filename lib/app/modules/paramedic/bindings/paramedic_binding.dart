import 'package:get/get.dart';
import '../controllers/paramedic_controller.dart';


class ParamedicBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ParamedicController>(
          () => ParamedicController(),
    );
  }

}