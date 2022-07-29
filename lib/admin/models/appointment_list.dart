class AppointmentList {
  AppointmentList({
    required this.id,
    required this.timeTable,
    required this.isEvaluated,
  });
  late final String id;
  late final TimeTable timeTable;
  late final bool isEvaluated;

  AppointmentList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    timeTable = TimeTable.fromJson(json['timeTable']);
    isEvaluated = json['isEvaluated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['timeTable'] = timeTable.toJson();
    _data['isEvaluated'] = isEvaluated;
    return _data;
  }
}

class TimeTable {
  TimeTable({
    required this.id,
    required this.start,
  });
  late final String id;
  late final String start;

  TimeTable.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['start'] = start;
    return _data;
  }
}