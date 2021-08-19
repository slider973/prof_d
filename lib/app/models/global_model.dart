class Global {
  String mockBaseUrl;
  String baseUrl;

  Global({this.mockBaseUrl, this.baseUrl});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
    baseUrl = json['base_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mock_base_url'] = this.mockBaseUrl;
    data['base_url'] = this.baseUrl;
    return data;
  }
}
