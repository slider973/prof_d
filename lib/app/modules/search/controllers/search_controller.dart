import '../../../models/doctor_model.dart';
import '../../../models/speciality_model.dart';
import '../../../repositories/docor_repository.dart';
import '../../../repositories/speciality_repository.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';

class SearchController extends GetxController {
  final heroTag = "".obs;
  final specialities = <Speciality>[].obs;

  final doctors = <Doctor>[].obs;
  DoctorRepository _doctorRepository;
  SpecialityRepository _specialityRepository;

  SearchController() {
    _doctorRepository = new DoctorRepository();
    _specialityRepository = new SpecialityRepository();
  }

  @override
  void onInit() async {
    await refreshSearch();
    super.onInit();
  }

  @override
  void onReady() {
    heroTag.value = Get.arguments as String;
    super.onReady();
  }

  Future refreshSearch({bool showMessage}) async {
    await searchDoctors();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of doctors refreshed successfully".tr));
    }
  }

  Future searchDoctors({String keywords}) async {
    try {
      doctors.value = await _doctorRepository.getAll();
      if (keywords != null && keywords.isNotEmpty) {
        doctors.value = doctors.where((Doctor _doctor) {
          return _doctor.name.toLowerCase().contains(keywords.toLowerCase());
        }).toList();
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getSpecialities() async {
    try {
      _specialityRepository.getAll().then((value) {
        specialities.clear();
        return value;
      }).then((value) {
        specialities.value = value;
      });
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}

