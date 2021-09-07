import '../../../models/doctor_model.dart';
import 'package:get/get.dart';
import '../../../models/booking_model.dart';
import '../../../repositories/booking_repository.dart';
import '../../../../common/ui.dart';

class BookingsController extends GetxController {
  BookingRepository _bookingRepository;

  var ongoingBookings = List<Booking>(0).obs;
  var completedBookings = List<Booking>(0).obs;
  var archivedBookings = List<Booking>(0).obs;

  BookingsController() {
    _bookingRepository = new BookingRepository();
  }

  @override
  void onInit() async {
    await refreshBooking();
    super.onInit();
  }

  Future refreshBooking({bool showMessage = false}) async {
    await getOngoingBookings();
    await getCompletedBookings();
    await getArchivedBookings();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Booking page refreshed successfully".tr));
    }
  }

  Future<void> getOngoingBookings({bool showMessage = false}) async {
    ongoingBookings.value = (await _bookingRepository.getOngoingBookings());
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Booking page refreshed successfully".tr));
    }
  }

  Future<void> getCompletedBookings({bool showMessage = false}) async {
    completedBookings.value = (await _bookingRepository.getCompletedBookings());
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Booking page refreshed successfully".tr));
    }
  }

  Future<void> getArchivedBookings({bool showMessage = false}) async {
    archivedBookings.value = (await _bookingRepository.getArchivedBookings());
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Booking page refreshed successfully".tr));
    }
  }

  List<Doctor> get ongoingServices => null;
}
