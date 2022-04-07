import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../authentification/models/user_model.dart';
import '../services/init_services/connectivity_service.dart';
import '../services/init_services/firebase_messaging_service.dart';
import '../services/init_services/services_initializer.dart';
import '../services/navigation_service.dart';
import '../utils/routes.dart';
import 'main_core_viewmodel.dart';

final splashViewModel = ChangeNotifierProvider.autoDispose<SplashViewModel>(
    (ref) => SplashViewModel(ref.read(mainCoreViewModelProvider)));

class SplashViewModel extends ChangeNotifier {
  final MainCoreViewModel _mainCoreVM;
  late String secondPage;

  SplashViewModel(this._mainCoreVM) {
    ConnectivityService.instance.checkIfConnected().then((value) async {
      await Future.delayed(const Duration(seconds: 2), () {});
      if (value) {
        initializeData().then(
          (_) {
            NavigationService.offAll(
              isNamed: true,
              page: secondPage,
            );
            if (secondPage == RoutePaths.home) {
              FirebaseMessagingService.instance.getInitialMessage();
            }
          },
        );
      } else {
        NavigationService.offAll(
          isNamed: true,
          page: RoutePaths.coreNoInternet,
          arguments: {'fromSplash': true},
        );
      }
    });
  }

  Future initializeData() async {
    List futures = [
      ServiceInitializer.instance.initializeData(),
      checkForCachedUser(),
    ];
    await Future.wait<dynamic>([...futures]);
  }

  Future checkForCachedUser() async {
    String? uid = _mainCoreVM.getCurrentUserAuthUid();

    if (uid != null) {
      UserModel? userModel =
          await _mainCoreVM.getUserDataFromFirebase(uid: uid);
      if (userModel != null) {
        _mainCoreVM.setCurrentUser(userModel: userModel);
        secondPage = RoutePaths.home;
        precacheImage(NetworkImage(userModel.image as String), Get.context!);
      } else {
        await _mainCoreVM.logoutUser();
        secondPage = RoutePaths.authLogin;
      }
    } else {
      secondPage = RoutePaths.authLogin;
    }
  }
}