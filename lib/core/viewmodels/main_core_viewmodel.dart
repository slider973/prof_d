import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../../authentification/models/user_model.dart';
import '../../authentification/repos/user_repo.dart';
import '../services/init_services/auth_service.dart';
import '../services/location_service.dart';

final mainCoreViewModelProvider =
    ChangeNotifierProvider<MainCoreViewModel>((ref) => MainCoreViewModel());

class MainCoreViewModel extends ChangeNotifier {
  ///User module methods
  Future<String?> getCurrentUserAuthToken() async {
    final token = await AuthService.instance.getUserTokenApiStored();
    if (token != null) {
      return token;
    }
    return null;
  }

  Future<UserModel?>? getUserData() async {
    try {
      return await UserRepo.instance.getUserData();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  clearCurrentUser() {
    UserRepo.instance.logoutUser();
  }

  UserModel? getCurrentUser() {
    return UserRepo.instance.userModel;
  }

  setCurrentUser({required UserModel userModel}) {
    UserRepo.instance.userModel = userModel;
  }

  Future getInvoices() async {
    if (kDebugMode) {
      print('getInvoices');
    }
    return await UserRepo.instance.getInvoices();
  }

  logoutUser() async {
    await AuthService.instance.clearUserTokenApi();
    UserRepo.instance.logoutUser();
  }

  ///Location module related...

  Future<bool> enableLocationAndRequestPermission() async {
    bool locationServiceEnabled = await enableLocationService();
    if (locationServiceEnabled) {
      return await requestLocationPermission() == PermissionStatus.granted;
    } else {
      return false;
    }
  }

  Future<bool> enableLocationService() async {
    return await LocationService.instance.enableLocationService();
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await LocationService.instance.requestLocationPermission();
  }

  Future<bool> enableBackgroundMode() async {
    return await LocationService.instance.enableBackgroundMode();
  }

  Future<LocationData?> getCurrentUserLocation() async {
    return await LocationService.instance.getLocation();
  }
}
