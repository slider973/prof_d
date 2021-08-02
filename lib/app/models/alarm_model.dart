import 'parents/model.dart';

class Alarm extends Model {
  String name;
  String frequencies;
  int available;
  DateTime start_from;
  DateTime end_at;
  DateTime add_frequencies;

  Alarm({
    this.start_from,
    this.end_at,
    this.add_frequencies
  });

  Alarm.fromJson(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      name = jsonMap['name'];
      frequencies = jsonMap['frequencies'];
      available = jsonMap['available'];
      start_from = DateTime.parse(jsonMap['start_from']);
      end_at = DateTime.parse(jsonMap['end_at']);
    } catch (e) {
      id = '';
      name = '';
      frequencies = '';
      available = 0;
      start_from = new DateTime(0);
      end_at = new DateTime(0);
      print(e);
    }
  }

/*  Map activeAlarmMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["active"] = !active;
    return map;
  }*/
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
