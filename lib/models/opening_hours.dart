class OpeningHours {
  OpeningHours({
    int? day,
    List<List<String>>? ranges,
    bool? enabled,}){
    _day = day;
    _ranges = ranges;
    _enabled = enabled;
  }

  OpeningHours.fromJson(dynamic json) {
    _day = json['day'];
    _ranges = json['ranges'] != null ? json['ranges'].cast<String>() : [];
    _enabled = json['enabled'];
  }
  int? _day;
  List<List<String>>? _ranges;
  bool? _enabled;

  int? get day => _day;
  List<List<String>>? get ranges => _ranges;
  bool? get enabled => _enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['ranges'] = _ranges;
    map['enabled'] = _enabled;
    return map;
  }

}