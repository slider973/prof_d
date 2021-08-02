import '../../../../common/ui.dart';
import '../../../models/doctor_model.dart';
import '../../../models/review_model.dart';
import '../../../repositories/docor_repository.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController{

  DoctorRepository _doctorRepository;

  final doctor = Doctor().obs;
  final reviews = <Review>[].obs;
  final heroTag = ''.obs;


  DoctorController(){
    this._doctorRepository = new DoctorRepository();
  }

  @override
  void onInit() async {
    doctor.value = Get.arguments['doctor'] as Doctor;
    heroTag.value = Get.arguments['heroTag'] as String;
    await refreshDoctor();
    super.onInit();
  }

  @override
  void onReady() async {
    await refreshDoctor();
    super.onReady();
  }

  Future refreshDoctor({bool showMessage = false}) async {
    await getDoctor();
    await getReviews();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: doctor.value.name + " " + "page refreshed successfully".tr));
    }
  }
  Future getDoctor() async {
    try {
      doctor.value = await _doctorRepository.getDoctor(doctor.value.id);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getReviews() async {
    try {
      reviews.value = await _doctorRepository.getReviews();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

}