import 'dart:io';


import 'package:flutter/foundation.dart';

import '../../core/services/apis_services/api_caller.dart';
import '../../core/services/apis_services/apis_paths.dart';
import '../../core/services/firebase_services/firebase_caller.dart';
import '../../core/services/firebase_services/firestore_paths.dart';
import '../../core/services/init_services/auth_service.dart';
import '../models/authentification_model.dart';
import '../models/user_model.dart';
import '../services/firebase_auth_api.dart';

class UserRepo {
  UserRepo._();

  static final UserRepo instance = UserRepo._();
  final AuthService _authService = AuthService.instance;
  final ApisCaller _apiCaller = ApisCaller.instance;

  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;
  String? uid;
  UserModel? userModel;
  AuthentificationModel authentificationModel = AuthentificationModel();

  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _apiCaller.postData(
        path: ApisPaths.signInWithEmailAndPasswordPath(),
        builder: (data) {
          if (data != null) {
            authentificationModel = AuthentificationModel.fromJson(data);
          }
          return null;
        },
        dataParams: {'username': email.toLowerCase(), 'password': password});
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

  Future updateUser(UserModel userData) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: userData.toMap(),
      merge: true,
    );
    userModel = userData;
  }

  Future updateUserName({required String name}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"name": name},
      merge: true,
    );
    userModel = userModel!.copyWith(name: name);
  }

  Future updateUserTokenPush({required String token}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"token": token},
      merge: true,
    );
    userModel = userModel!.copyWith(token: token);
  }

  Future updateUserPhone({required String phone}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"phone": phone},
      merge: true,
    );
    userModel = userModel!.copyWith(phone: phone);
  }

  Future updateUserImage({required File? imageFile}) async {
    String? _picUrl = await _firebaseCaller.uploadImage(
      path: FirestorePaths.profilesImagesPath(userModel!.id!),
      file: imageFile!,
    );
    if (_picUrl != null) {
      await _firebaseCaller.setData(
        path: FirestorePaths.userDocument(uid!),
        data: {"image": _picUrl},
        merge: true,
      );
      userModel = userModel!.copyWith(image: _picUrl);
    }
  }

  Future logoutUser() async {
    uid = null;
    userModel = null;
    await FirebaseAuthAPI.instance.signOut();
  }
}
