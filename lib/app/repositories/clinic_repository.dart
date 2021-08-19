import 'package:dio/dio.dart';
import '../models/review_model.dart';
import '../models/clinic_model.dart';
import '../providers/mock_provider.dart';

class ClinicRepository{
  ApiClient _apiClient;

  ClinicRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Clinic>> getAll() {
    return _apiClient.getAllClinics();
  }

  Future<List<Clinic>> getClinicsNearbyYou() {
    return _apiClient.getClinicsNearbyYou();
  }

  Future<Clinic>getClinic(String id){
    return _apiClient.getClinic(id);
  }

  Future<List<Review>> getReviews() {
    return _apiClient.getClinicReviews();
  }
}