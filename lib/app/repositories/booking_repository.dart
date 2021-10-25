import 'package:dio/dio.dart';
import '../models/address_model.dart';

import '../models/booking_model.dart';
import '../providers/booking_provider.dart';
import '../providers/mock_provider.dart';

class BookingRepository {
  ApiClient _apiClient;
  BookingApiClient _authApiClient;

  BookingRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
    this._authApiClient = BookingApiClient(httpClient: Dio());
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

  Future<List<Address>> getAddressesToBookings() {
    return _authApiClient.getAddressesToBookings();
  }
}
