class AuthentificationModel {
  String? accessToken;
  String? refreshToken;

  AuthentificationModel({String? accessToken, String? refreshToken}) {
    if (accessToken != null) {
      accessToken = accessToken;
    }
    if (refreshToken != null) {
      refreshToken = refreshToken;
    }
  }

  AuthentificationModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}