import 'package:dio/dio.dart';
import '../models/speciality_model.dart';
import '../providers/mock_provider.dart';

class SpecialityRepository {

  ApiClient _apiClient;

  SpecialityRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Speciality>> getAll() {
    return _apiClient.getAllSpecialities();
  }

  Future<List<Speciality>> getFeaturedSpecialities() {
    return null;
    //return _apiClient.getFeaturedSpecialities();
  }
}