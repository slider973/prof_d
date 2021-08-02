import 'package:dio/dio.dart';
import 'package:prof_b/app/models/alarm_model.dart';

import '../models/notification_model.dart';
import '../providers/mock_provider.dart';

class AlarmRepository {
  MockApiClient _apiClient;

  AlarmRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<Alarm>> getAll() {
    return _apiClient.getAlarms();
  }
}
