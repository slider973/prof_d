import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/ui.dart';
import '../models/address_model.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthService extends GetxService {
  final user = User().obs;
  final address = Address().obs;
  GetStorage _box;

  UserRepository _usersRepo;

  AuthService() {
    _usersRepo = new UserRepository();
    _box = new GetStorage();
  }

  Future<AuthService> init() async {
    user.value.auth = false;
    address.listen((Address _address) {
      _box.write('current_address', _address);
    });

    // await getAddress();

    return this;
  }

  Future register(User userToSave) async {
    try {
      user.value = await _usersRepo.register(userToSave);
      user.value.auth = true;
    } on DioError catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future login(User userLogin) async {
    try {
      if (_box.hasData('current_user')) {
        user.value = User.fromJson(await _box.read('current_user'));
      } else {
        user.value = await _usersRepo.login(userLogin);
        user.value.auth = true;
      }
    } on DioError catch (e) {
      print(e);
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getAddress() async {
    try {
      if (_box.hasData('current_address')) {
        address.value = Address.fromJson(await _box.read('current_address'));
      } else {
        List<Address> _addresses = await _usersRepo.getAddresses();
        if (_addresses.isNotEmpty) {
          address.value = _addresses
              .firstWhere((_address) => _address.isDefault, orElse: () {
            return _addresses.first;
          });
        } else {
          address.value = new Address(address: "Please choose your address".tr);
        }
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  bool get isAuth => user.value.auth ?? false;
}
