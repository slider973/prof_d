import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/init_services/firebase_messaging_service.dart';
import '../../core/utils/dialogs.dart';
import '../../core/utils/navigate.dart';
import '../../core/utils/validators.dart';
import '../../core/viewmodels/main_core_viewmodel.dart';
import '../http_client/custom_chooper_client.dart';
import '../models/user_model.dart';
import '../repos/user_repo.dart';
import '../services/api_json_caller.dart';
import 'auth_loading_provider_viewmodel.dart';

enum AuthType { login, register }

final authViewModel = ChangeNotifierProvider.autoDispose<AuthViewModel>(
    (ref) => AuthViewModel(ref));

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this.ref) {
    _mainCoreVM = ref.watch(mainCoreViewModelProvider);
  }

  final Ref ref;
  late MainCoreViewModel _mainCoreVM;

  TextEditingController emailController =
      TextEditingController(text: "test@test.fr");
  TextEditingController passwordController =
      TextEditingController(text: "Jonathan5");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "");

  String? Function(String?)? validateLoginEmail() {
    return Validators.instance.validateEmail();
  }

  String? Function(String?)? validateLoginPassword() {
    return Validators.instance.validateLoginPassword();
  }

  String? Function(String? p1)? validateConfirmLoginPassword() {
    return Validators.instance
        .validateConfirmLoginPassword(passwordController.text);
  }

  signUpWithEmailAndPassword(context) async {
    try {
      ref.read(authLoadingProvider.notifier).state = true;
      removeAllFocus(context);

      await UserRepo.instance.signUpWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (UserRepo.instance.authentificationModel.accessToken != null) {
        await submitLogin();
      }
      ref.read(authLoadingProvider.notifier).state = false;
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showEmailOrPassIncorrectDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    }
  }

  signInWithEmailAndPassword(context) async {
    try {
      print('1');
      ref.read(authLoadingProvider.notifier).state = true;
      print('2');
      removeAllFocus(context);
      print('3');
      await UserRepo.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print('4');
      if (UserRepo.instance.authentificationModel.accessToken != null) {
        await submitLogin();
      }
      print('2');
      ref.read(authLoadingProvider.notifier).state = false;
    } catch (e) {
      print(e);
      AppDialogs.showEmailOrPassIncorrectDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    }
  }

  onFirebaseAuthException(FirebaseAuthException error) {
    if (error.code == 'network-request-failed') {
      AppDialogs.showDefaultErrorDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    } else {
      AppDialogs.showEmailOrPassIncorrectDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    }
  }

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future submitLogin() async {
    debugPrint('start to get me with token');
    try {
      print('submitLogin 1');
      UserModel? client = await UserRepo.instance.getUserData(
          token: UserRepo.instance.authentificationModel.accessToken,
      );
      print('submitLogin 2');
      _mainCoreVM.setCurrentUser(userModel: client!);
      // subscribeUserToTopic();
      if (client.role != 'admin') {
        print('submitLogin 3');
        NavigateUtils.instance.navigationToIntroductionScreen();
      } else {
        print('submitLogin 4');
        NavigateUtils.instance.navigationToAdminScreen();
      }
    } catch (e) {
      print('error toto: $e');
      //AppDialogs.showDefaultErrorDialog();
    }
  }

  initAuthService() {
    final client = CustomChopperClient.createChopperClient();
    ApiJsonCaller.instance.setChopperClient(client);
  }

  subscribeUserToTopic() {
    FirebaseMessagingService.instance.subscribeToTopic(
      topic: 'general',
    );
  }
}
