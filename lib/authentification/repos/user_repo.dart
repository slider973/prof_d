import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../api_prof_d/api_json.swagger.dart';
import '../../core/services/apis_services/api_caller.dart';
import '../../core/services/apis_services/apis_paths.dart';
import '../../core/services/init_services/auth_service.dart';
import '../models/authentification_model.dart';
import '../models/user_model.dart';
import '../services/api_json_caller.dart';
import '../services/firebase_auth_api.dart';

class UserRepo {
  UserRepo._();

  static final UserRepo instance = UserRepo._();
  final AuthService _authService = AuthService.instance;
  final ApisCaller _apiCaller = ApisCaller.instance;
  final ApiJson apiJson = ApiJsonCaller.instance.apiJsonInstance!;

  String? uid;
  UserModel? userModel;
  AuthentificationModel authentificationModel = AuthentificationModel();

  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password}) async {

    final result = await apiJson.authLoginPost(
        body: LoginDto.fromJson(
            {'username': email.toLowerCase(), 'password': password}));
    if (result.statusCode == 200 | 201) {
      if (result.body != null) {

        authentificationModel = AuthentificationModel.fromJson(result.body);
        if(authentificationModel.accessToken != null) {
          _authService.setUserTokenApi(authentificationModel.accessToken!);
        }

      }
    }
    return null;
  }

  Future<UserModel?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _apiCaller.postData(
        path: ApisPaths.signUpWithEmailAndPasswordPath(),
        builder: (data) {
          if (data != null) {
            authentificationModel = AuthentificationModel.fromJson(data);
          }
          return null;
        },
        dataParams: {'email': email.toLowerCase(), 'password': password});
  }

  // Future<UserModel?> setUserData({required String token}) async {
  //   final _currentStoredUser = await getUserData(token: token);
  //   if (_currentStoredUser == null) {
  //     _firebaseCaller.setData(
  //       path: FirestorePaths.userDocument(userData.uId),
  //       data: userData.toMap(),
  //     );
  //     userModel = userData;
  //     return userModel;
  //   } else {
  //     return _currentStoredUser;
  //   }
  // }

  Future<UserModel?> getUserData({String? token}) async {
    final userToken = token ?? await _authService.getUserTokenApiStored();
    _apiCaller.dio.options.headers["Authorization"] = "Bearer " + userToken!;
    return await _apiCaller.getData(
        path: ApisPaths.mePatch(),
        queryParameters: {},
        builder: (userData) {
          debugPrint(userData.toString());
          return UserModel.fromMap(userData!);
        });
  }

  Future updateUserName({required String name}) async {
    userModel = userModel!.copyWith(name: name);
  }

  Future updateUserTokenPush({required String token}) async {
    userModel = userModel!.copyWith(token: token);
  }

  Future updateUser({required Map<String, dynamic> user}) async {
    return await _apiCaller.patchData(
        path: ApisPaths.updateUserProfilePath(),
        dataParams: user,
        builder: (user) {
          if (user != null) {
            print('in updateUser $user');
            return UserModel.fromMap(user);
          }
        });
  }

  Future updateUserImage({required File? imageFile}) async {
    userModel = userModel!.copyWith(image: imageFile?.path);
  }

  Future logoutUser() async {
    uid = null;
    userModel = null;
    await FirebaseAuthAPI.instance.signOut();
  }
}
