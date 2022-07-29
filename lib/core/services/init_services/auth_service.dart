import 'history_service.dart';

const userStoredTokenApi = 'user_stored_token_api';
const userStoredRefreshTokenApi = 'user_stored_refresh_token_api';

class AuthService {
  AuthService._();

  static final instance = AuthService._();

  Future setUserTokenApi(String token) async {
    await HistoryService.instance.saveData(
      key: userStoredTokenApi,
      value: token,
      dataType: DataType.string,
    );
  }

  Future<String?> getUserTokenApiStored() async {
    String? userStoredTokenApiGot = await HistoryService.instance.restoreData(
      key: userStoredTokenApi,
      dataType: DataType.string,
    );
    return userStoredTokenApiGot;
  }


  Future setUserRefreshTokenApi(String token) async {
    await HistoryService.instance.saveData(
      key: userStoredRefreshTokenApi,
      value: token,
      dataType: DataType.string,
    );
  }

  Future<String?> getUserRefreshTokenApiStored() async {
    String? userStoredTokenApiGot = await HistoryService.instance.restoreData(
      key: userStoredRefreshTokenApi,
      dataType: DataType.string,
    );
    return userStoredTokenApiGot;
  }
}
