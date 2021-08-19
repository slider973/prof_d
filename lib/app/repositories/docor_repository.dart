import 'package:dio/dio.dart';
import '../models/review_model.dart';
import '../models/doctor_model.dart';
import '../providers/mock_provider.dart';

class DoctorRepository{
  ApiClient _apiClient;

  DoctorRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Doctor>> getAll() {
    return _apiClient.getAllDoctors();
  }

  Future<List<Doctor>> getTopDoctors() {
    return _apiClient.getTopDoctors();
  }

  Future<Doctor>getDoctor(String id){
    return _apiClient.getDoctor(id);
  }

  Future<List<Review>> getReviews() {
    return _apiClient.getDoctorReviews();
  }
}