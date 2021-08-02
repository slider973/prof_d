import 'package:prof_b/app/models/booking_model.dart';
import 'package:prof_b/app/models/clinic_model.dart';
import 'package:prof_b/app/models/review_model.dart';
import 'package:prof_b/app/repositories/booking_repository.dart';
import 'package:prof_b/app/repositories/clinic_repository.dart';

import '../../../models/address_model.dart';
import '../../../models/doctor_model.dart';
import '../../../models/speciality_model.dart';
import '../../../repositories/docor_repository.dart';
import '../../../repositories/speciality_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../services/auth_service.dart';
import '../../../../common/ui.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  UserRepository _userRepository;
  SpecialityRepository _specialityRepository;
  DoctorRepository _doctorRepository;
  ClinicRepository _clinicRepository;


  final addresses = <Address>[].obs;
  final specialities = <Speciality>[].obs;
  final featuredSpecialities = <Speciality>[].obs;
  final topDoctors = <Doctor>[].obs;
  final clinics = <Clinic>[].obs;
  final clinicsNearbyYou = <Clinic>[].obs;

  HomeController(){
    _userRepository = new UserRepository();
    _specialityRepository = new SpecialityRepository();
    _doctorRepository = new DoctorRepository();
    _clinicRepository = new ClinicRepository();
  }

  @override
  Future<void> onInit() async {
    await refreshHome();
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getAddresses();
    await getSpecialities();
    await getTopDoctors();
    await getClinicsNearbyYou();

    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

  Address get currentAddress {
    return Get.find<AuthService>().address.value;
  }

  Future getAddresses() async {
    try {
      addresses.value = await _userRepository.getAddresses();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getSpecialities() async {
    try{
      specialities.value = await _specialityRepository.getAll();
    }catch(e){
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getFeaturedSpecialities() async {
    try{
      featuredSpecialities.value = await _specialityRepository.getFeaturedSpecialities();
    }catch(e){
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getTopDoctors () async{
    try{
      topDoctors.value = await _doctorRepository.getTopDoctors();
    }catch(e){
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getClinicsNearbyYou() async{
    try{
      clinicsNearbyYou.value = await _clinicRepository.getClinicsNearbyYou();
    }catch(e){
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

}