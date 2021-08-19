import 'package:dio/dio.dart';

import '../models/notification_model.dart';
import '../providers/mock_provider.dart';

class NotificationRepository {
  ApiClient _apiClient;

  NotificationRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Notification>> getAll() {
    return _apiClient.getNotifications();
  }
}
