import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/address_model.dart';
import '../models/api/api_response_result_parent_admin.dart';

import '../services/global_service.dart';

class BookingApiClient {
  final _globalService = Get.find<GlobalService>();

  String get apiBaseUrl => _globalService.global.value.baseUrl;

  final Dio httpClient;
  final Options _options =
      buildCacheOptions(Duration(days: 3), forceRefresh: true);

  BookingApiClient({@required this.httpClient}) {
    httpClient.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: apiBaseUrl)).interceptor);
  }

  Future<dynamic> getLocationBooking() async {
    var response = await httpClient.get(apiBaseUrl + "auth/local/register",
        options: _options);
  }

  Future<List<Address>> getAddressesToBookings() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    var response = await httpClient.get<List<dynamic>>(
        apiBaseUrl + "parent-admins",
        options: Options(headers: headers, responseType: ResponseType.json));

    if (response.statusCode == 200) {
      List<ApiResponseResultParentAdmin> resultTest = response.data.map((e) {
        return ApiResponseResultParentAdmin.fromJson(e);
      }).toList();

      return resultTest.first.addresses;
    } else {
      throw new Exception(response.statusMessage);
    }
  }
}
