import '../../../repositories/clinic_repository.dart';
import '../../../../common/ui.dart';
import '../../../models/clinic_model.dart';
import '../../../models/review_model.dart';
import 'package:get/get.dart';

class ClinicController extends GetxController{

  ClinicRepository _clinicRepository;

  final clinic = Clinic().obs;
  final reviews = <Review>[].obs;
  final heroTag = ''.obs;
  final currentSlide = 0.obs;


  ClinicController(){
    this._clinicRepository = new ClinicRepository();
  }

  @override
  void onInit() async {
    clinic.value = Get.arguments['clinic'] as Clinic;
    heroTag.value = Get.arguments['heroTag'] as String;
    await refreshClinic();
    super.onInit();
  }

  @override
  void onReady() async {
    await refreshClinic();
    super.onReady();
  }

  Future refreshClinic({bool showMessage = false}) async {
    await getClinic();
    await getReviews();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: clinic.value.name + " " + "page refreshed successfully".tr));
    }
  }
  Future getClinic() async {
    try {
      clinic.value = await _clinicRepository.getClinic(clinic.value.id);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getReviews() async {
    try {
      reviews.value = await _clinicRepository.getReviews();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

}