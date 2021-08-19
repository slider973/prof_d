import 'package:dio/dio.dart';
import 'package:prof_b/app/models/alarm_model.dart';

import '../models/notification_model.dart';
import '../providers/mock_provider.dart';

class AlarmRepository {
  ApiClient _apiClient;

  AlarmRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Alarm>> getAll() {
    return _apiClient.getAlarms();
  }
}
