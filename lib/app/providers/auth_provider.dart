import 'package:dio/dio.dart' as DioLib;
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetLib;
import '../models/auth_model.dart';

import '../models/user_model.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import '../services/global_service.dart';

class AuthApiClient {
  final _globalService = GetLib.Get.find<GlobalService>();

  String get baseUrl => _globalService.global.value.baseUrl;

  final DioLib.Dio httpClient;
  final DioLib.Options _options =
      buildCacheOptions(Duration(days: 3), forceRefresh: true);

  AuthApiClient({@required this.httpClient}) {
    httpClient.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }

  Future<User> register(User userObjectToRegister) async {
    DioLib.FormData formData =
        new DioLib.FormData.fromMap(userObjectToRegister.toJson());
    var response = await httpClient.post(baseUrl + "auth/local/register",
        data: formData, options: _options);
    var newAuth = Auth.fromJson(response.data);
    var userAuth = new User();
    userAuth.apiToken = newAuth.jwt;
    userAuth.username = newAuth.user.username;
    userAuth.provider = newAuth.user.provider;
    userAuth.email = newAuth.user.email;
    return userAuth;
  }
}
