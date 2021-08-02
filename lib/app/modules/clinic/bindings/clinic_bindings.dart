import '../controllers/clinic_controller.dart';
import 'package:get/get.dart';

class ClinicBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ClinicController>(
            () => ClinicController()
    );
  }

}