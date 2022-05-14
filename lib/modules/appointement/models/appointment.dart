import 'pass.dart';

import 'coming_soon.dart';

class Appointment {
  Appointment({
    required this.comingSoon,
    required this.pass,
  });
  late final List<ComingSoon> comingSoon;
  late final List<Pass> pass;

  Appointment.fromJson(Map<String, dynamic> json){
    comingSoon = List.from(json['comingSoon']).map((e)=>ComingSoon.fromJson(e)).toList();
    pass = List.from(json['pass']).map((e)=>Pass.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['comingSoon'] = comingSoon.map((e)=>e.toJson()).toList();
    _data['pass'] = pass.map((e)=>e.toJson()).toList();
    return _data;
  }
}