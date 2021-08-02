import '../../../models/speciality_model.dart';
import '../../../repositories/speciality_repository.dart';
import '../../../../common/ui.dart';
import 'package:get/get.dart';

enum SpecialitiesLayout { GRID, LIST }

class SpecialitiesController extends GetxController{
  SpecialityRepository  _specialityRepository;

  final specialities = List<Speciality>(0).obs;
  final layout = SpecialitiesLayout.LIST.obs;

  SpecialitiesController(){
    _specialityRepository = new SpecialityRepository();
  }
  @override
  Future<void> onInit() async {
    await refreshSpecialities();
    super.onInit();
  }

  Future refreshSpecialities({bool showMessage}) async{
    await getSpecialities();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of specialities refreshed successfully".tr));
    }
  }

  Future getSpecialities() async{
    try{
      specialities.value = await _specialityRepository.getAll();
    } catch(e){
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

}