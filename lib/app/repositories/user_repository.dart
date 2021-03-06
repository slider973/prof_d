import 'package:dio/dio.dart';
import '../models/user_login_model.dart';
import '../providers/auth_provider.dart';
import '../models/address_model.dart';
import '../models/user_model.dart';
import '../providers/mock_provider.dart';

class UserRepository {
  ApiClient _apiClient;
  AuthApiClient _authApiClient;

  UserRepository() {
    this._apiClient = ApiClient(httpClient: Dio());
    this._authApiClient = AuthApiClient(httpClient: Dio());
  }

  Future<List<User>> getAll() {
    return _apiClient.getAllUsers();
  }

  Future<User> register(User user) {
    return _authApiClient.register(user);
  }

  Future<User> login(User user) {
    final userLogin = new UserLogin();
    userLogin.identifier = user.email;
    userLogin.password = user.password;
    return _authApiClient.login(userLogin);
  }

  Future<List<Address>> getAddresses() {
    return _apiClient.getAddresses();
  }
}
