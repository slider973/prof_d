import '../../../models/paramedic_model.dart';
import '../../../repositories/paramedic_repository.dart';
import '../../../../common/ui.dart';
import 'package:get/get.dart';

class ParamedicController extends GetxController{

  final paramedics = List<Paramedic>(0).obs;
  final paramedicNearbyYou = Paramedic().obs;
  ParamedicRepository _paramedicRepository;


  ParamedicController(){
    _paramedicRepository = new ParamedicRepository();
  }
  @override
  Future<void> onInit() async {
    await refreshEmergency();
    super.onInit();
  }

  Future refreshEmergency({bool showMessage = false}) async {
    await getParamedicNearbyYou();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Emergency page refreshed successfully".tr));
    }
  }

  Future getAllParamedics () async {
    try {
      paramedics.value = await _paramedicRepository.getAllParamedics();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getParamedicNearbyYou () async {
    try {
      paramedicNearbyYou.value = await _paramedicRepository.getParamedicNearbyYou();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

}