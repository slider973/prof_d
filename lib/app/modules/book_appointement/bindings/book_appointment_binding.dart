import 'package:get/get.dart';

import '../controllers/book_appointment_controller.dart';

class BookingAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingAppointmentController>(
      () => BookingAppointmentController(),
    );
  }
}
