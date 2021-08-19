import 'package:dio/dio.dart';
import '../models/paramedic_model.dart';
import '../providers/mock_provider.dart';

class ParamedicRepository{
  ApiClient _apiClient;

  ParamedicRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
  }

  Future<List<Paramedic>> getAllParamedics() {
    return _apiClient.getAllParamedics();
  }

  Future<Paramedic> getParamedicNearbyYou() {
    return _apiClient.getParamedicNearbyYou();
  }
}