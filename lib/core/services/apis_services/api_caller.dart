import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../api_prof_d/api_json.swagger.dart';
import '../../utils/dialogs.dart';

class ApisCaller {
  ApisCaller._() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://localhost:3000',
          connectTimeout: 20000,
          receiveTimeout: 20000),
    );
  }

  static final instance = ApisCaller._();

  late Dio dio;

  getApiJsonInstance() {
    return ApiJson.create(baseUrl: 'http://localhost:3000');
  }

  Future<T> getData<T>({
    required String path,
    required Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>? data) builder,
  }) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return builder(response.data);
      }
      return builder(null);
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
      return builder(null);
    }
  }

  Future<T> postData<T>({
    required String path,
    required Map<String, String> dataParams,
    required T Function(Map<String, dynamic>? data) builder,
  }) async {
    try {
      debugPrint(dataParams.toString());
      Response response = await dio.post(path, data: dataParams);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(response.data);
      }
      return builder(null);
    } on DioError catch (e) {
      print(e.response.toString());
      AppDialogs.showDefaultErrorDialog();
      return builder(null);
    }
  }

  Future<T> patchData<T>({
    required String path,
    required Map<String, dynamic> dataParams,
    required T Function(Map<String, dynamic>? data) builder,
  }) async {
    try {
      debugPrint(dataParams.toString());
      Response response = await dio.patch(path, data: dataParams);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(response.data);
      }
      return builder(null);
    } on DioError catch (e) {
      print(e.response.toString());
      AppDialogs.showDefaultErrorDialog();
      return builder(null);
    }
  }
}
