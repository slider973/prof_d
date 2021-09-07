import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/global_service.dart';

import 'package:dio/dio.dart' as DioLib;


class BookingApiClient {
  final _globalService = Get.find<GlobalService>();
  String get apiBaseUrl => _globalService.global.value.baseUrl;

  final Dio httpClient;
  final Options _options = buildCacheOptions(Duration(days: 3), forceRefresh: true);

  BookingApiClient({@required this.httpClient}) {
    httpClient.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: apiBaseUrl)).interceptor);
  }

  Future<dynamic> getLocationBooking() async {
    var response = await httpClient.get(apiBaseUrl + "auth/local/register", options: _options);

  }
}