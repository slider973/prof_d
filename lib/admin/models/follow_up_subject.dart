class FollowUpSubject {
  FollowUpSubject({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  FollowUpSubject.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    return _data;
  }
}
