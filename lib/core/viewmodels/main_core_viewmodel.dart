import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../../authentification/models/user_model.dart';
import '../../authentification/repos/user_repo.dart';
import '../services/location_service.dart';

final mainCoreViewModelProvider =
    ChangeNotifierProvider<MainCoreViewModel>((ref) => MainCoreViewModel());

class MainCoreViewModel extends ChangeNotifier {
  ///User module methods
  String? getCurrentUserAuthUid() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.uid;
    }
    return null;
  }

  Future<UserModel?>? getUserDataFromFirebase({required String uid}) async {
    try {
      return await UserRepo.instance.getUserData();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  setUserTokenPush({required String uid, required String token}) async {
    await UserRepo.instance.updateUserTokenPush(token: token);
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

  Future logoutUser() async {
    await UserRepo.instance.logoutUser();
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
