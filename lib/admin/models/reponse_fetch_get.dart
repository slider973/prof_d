import 'follow_up_subject.dart';

class ResponseFetchGetFollowUpSubject {
  ResponseFetchGetFollowUpSubject({
    required this.success,
    required this.result,
  });
  late final bool success;
  late final List<FollowUpSubject> result;

  ResponseFetchGetFollowUpSubject.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = List.from(json['result'])
        .map((e) => FollowUpSubject.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}
