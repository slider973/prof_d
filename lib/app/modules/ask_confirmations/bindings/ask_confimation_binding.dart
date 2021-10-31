import 'package:get/get.dart';
import '../controllers/ask_confirmation_controller.dart';

class AskConfirmationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AskConfirmationController>(
            () => AskConfirmationController()
    );
  }
}