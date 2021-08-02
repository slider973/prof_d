import 'package:dio/dio.dart';

import '../providers/mock_provider.dart';
import 'package:get/get.dart';

import '../models/booking_model.dart';
class BookingRepository {
  MockApiClient _apiClient;

  BookingRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<Booking>> getOngoingBookings() {
    return _apiClient.getBookings();
  }

  Future<List<Booking>> getCompletedBookings() {
    return _apiClient.getBookings();
  }

  Future<List<Booking>> getArchivedBookings() {
    return _apiClient.getBookings();
  }

}
