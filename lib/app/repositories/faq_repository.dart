import 'package:dio/dio.dart';

import '../models/faq_category_model.dart';
import '../providers/mock_provider.dart';

class FaqRepository {
  ApiClient _apiClient;

  FaqRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<FaqCategory>> getCategoriesWithFaqs() {
    return _apiClient.getCategoriesWithFaqs();
  }
}
