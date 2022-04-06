import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../authentification/repos/user_repo.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/utils/routes.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import 'home_viewmodel.dart';

final createProfileViewModelProvider =
    ChangeNotifierProvider<CreateProfileFormViewModel>(
        (ref) => CreateProfileFormViewModel(ref));

class CreateProfileFormViewModel extends ChangeNotifier {
  final Ref ref;
  late MainCoreViewModel _mainCoreVM;
  late HomeViewModel _homeViewModel;

  CreateProfileFormViewModel(this.ref) {
    _mainCoreVM = ref.read(mainCoreViewModelProvider.notifier);
  }

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nameOfBirdController = TextEditingController();
  final TextEditingController cityOfBirdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController civilityController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  Map<String, dynamic> buildNewProfileObject() {
    return {
      "firstname": firstnameController.value.text,
      "lastname": lastnameController.value.text,
      "civility": civilityController.text,
      "nameOfBirth": nameOfBirdController.text,
      "cityOfBird": cityOfBirdController.text,
      "phone": phoneController.text,
      "isProfileCreated": true,
    };
  }

  sendData(BuildContext context) async {
    removeAllFocus(context);
    _mainCoreVM.setCurrentUser(userModel: await UserRepo.instance.updateUser(user: buildNewProfileObject()));
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.home,
    );
  }

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
