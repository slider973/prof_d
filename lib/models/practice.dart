import 'opening_hours.dart';

class Practice {
  Practice({
    int? id,
    String? address,
    String? zipcode,
    String? city,
    int? floor,
    double? latitude,
    double? longitude,
    bool? elevator,
    bool? handicap,
    String? formalName,
    String? intercom,
    String? code1,
    String? code2,
    String? note,
    String? landlineNumber,
    dynamic receptionInfo,
    String? fullAddress,
    List<OpeningHours>? openingHours,
    String? practiceFloor,
    List<String>? accessInformations,
    String? placeSlug,
  }) {
    _id = id;
    _address = address;
    _zipcode = zipcode;
    _city = city;
    _floor = floor;
    _latitude = latitude;
    _longitude = longitude;
    _elevator = elevator;
    _handicap = handicap;
    _formalName = formalName;
    _intercom = intercom;
    _code1 = code1;
    _code2 = code2;
    _note = note;
    _landlineNumber = landlineNumber;
    _receptionInfo = receptionInfo;
    _fullAddress = fullAddress;
    _openingHours = openingHours;
    _practiceFloor = practiceFloor;
    _accessInformations = accessInformations;
    _placeSlug = placeSlug;
  }

  Practice.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _zipcode = json['zipcode'];
    _city = json['city'];
    _floor = json['floor'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _elevator = json['elevator'];
    _handicap = json['handicap'];
    _formalName = json['formal_name'];
    _intercom = json['intercom'];
    _code1 = json['code1'];
    _code2 = json['code2'];
    _note = json['note'];
    _landlineNumber = json['landline_number'];
    _receptionInfo = json['reception_info'];
    _fullAddress = json['full_address'];
    if (json['opening_hours'] != null) {
      _openingHours = [];
      json['opening_hours'].forEach((v) {
        _openingHours?.add(OpeningHours.fromJson(v));
      });
    }
    _practiceFloor = json['practice_floor'];
    _accessInformations = json['access_informations'] != null
        ? json['access_informations'].cast<String>()
        : [];
    _placeSlug = json['place_slug'];
  }
  int? _id;
  String? _address;
  String? _zipcode;
  String? _city;
  int? _floor;
  double? _latitude;
  double? _longitude;
  bool? _elevator;
  bool? _handicap;
  String? _formalName;
  String? _intercom;
  String? _code1;
  String? _code2;
  String? _note;
  String? _landlineNumber;
  dynamic _receptionInfo;
  String? _fullAddress;
  List<OpeningHours>? _openingHours;
  String? _practiceFloor;
  List<String>? _accessInformations;
  String? _placeSlug;

  int? get id => _id;
  String? get address => _address;
  String? get zipcode => _zipcode;
  String? get city => _city;
  int? get floor => _floor;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  bool? get elevator => _elevator;
  bool? get handicap => _handicap;
  String? get formalName => _formalName;
  String? get intercom => _intercom;
  String? get code1 => _code1;
  String? get code2 => _code2;
  String? get note => _note;
  String? get landlineNumber => _landlineNumber;
  dynamic get receptionInfo => _receptionInfo;
  String? get fullAddress => _fullAddress;
  List<OpeningHours>? get openingHours => _openingHours;
  String? get practiceFloor => _practiceFloor;
  List<String>? get accessInformations => _accessInformations;
  String? get placeSlug => _placeSlug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['zipcode'] = _zipcode;
    map['city'] = _city;
    map['floor'] = _floor;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['elevator'] = _elevator;
    map['handicap'] = _handicap;
    map['formal_name'] = _formalName;
    map['intercom'] = _intercom;
    map['code1'] = _code1;
    map['code2'] = _code2;
    map['note'] = _note;
    map['landline_number'] = _landlineNumber;
    map['reception_info'] = _receptionInfo;
    map['full_address'] = _fullAddress;
    if (_openingHours != null) {
      map['opening_hours'] = _openingHours?.map((v) => v.toJson()).toList();
    }
    map['practice_floor'] = _practiceFloor;
    map['access_informations'] = _accessInformations;
    map['place_slug'] = _placeSlug;
    return map;
  }
}
