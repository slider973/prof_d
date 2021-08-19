import 'package:dio/dio.dart';

import '../models/setting_model.dart';
import '../providers/mock_provider.dart';

class SettingRepository {
  ApiClient _apiClient;

  SettingRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<Setting> get() {
    return _apiClient.getSettings();
  }
}
