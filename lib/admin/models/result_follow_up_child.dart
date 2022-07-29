class ResultFollowUpChild {
  ResultFollowUpChild({
    required this.success,
    required this.result,
  });
  late final bool success;
  late final FollowUpChild result;

  ResultFollowUpChild.fromJson(Map<String, dynamic> json){
    success = json['success'];
    result = FollowUpChild.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['result'] = result.toJson();
    return _data;
  }
}

class FollowUpChild {
  FollowUpChild({
    required this.numberOfActivities,
    required this.numberOfFollowUp,
    required this.stateBefore,
    required this.stateAfter,
    required this.raison,
    required this.start,
    required this.end,
  });
  late final int numberOfActivities;
  late final int numberOfFollowUp;
  late final String stateBefore;
  late final String stateAfter;
  late final String raison;
  late final String start;
  late final String end;

  FollowUpChild.fromJson(Map<String, dynamic> json){
    numberOfActivities = json['numberOfActivities'];
    numberOfFollowUp = json['numberOfFollowUp'];
    stateBefore = json['stateBefore'];
    stateAfter = json['stateAfter'];
    raison = json['raison'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['numberOfActivities'] = numberOfActivities;
    _data['numberOfFollowUp'] = numberOfFollowUp;
    _data['stateBefore'] = stateBefore;
    _data['stateAfter'] = stateAfter;
    _data['raison'] = raison;
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}