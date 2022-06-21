class AppointmentList {
  AppointmentList({
    required this.id,
    required this.timeTable,
  });
  late final String id;
  late final TimeTable timeTable;

  AppointmentList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    timeTable = TimeTable.fromJson(json['timeTable']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['timeTable'] = timeTable.toJson();
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