import 'payment_means.dart';

class Profile {
  Profile({
    String? link,
    String? cloudinaryPublicId,
    int? id,
    String? city,
    String? nameWithTitle,
    String? physicianIdentifier,
    String? rpps,
    String? title,
    String? ownerType,
    String? bio,
    bool? searchable,
    bool? trashed,
    String? speciality,
    int? specialityId,
    bool? medical,
    bool? organization,
    bool? specialityAllowMultipleBooking,
    bool? allowOnlineBooking,
    bool? displayPaymentMeans,
    PaymentMeans? paymentMeans,
    bool? insuranceCard,
    String? regulationSector,
  }) {
    _link = link;
    _cloudinaryPublicId = cloudinaryPublicId;
    _id = id;
    _city = city;
    _nameWithTitle = nameWithTitle;
    _physicianIdentifier = physicianIdentifier;
    _rpps = rpps;
    _title = title;
    _ownerType = ownerType;
    _bio = bio;
    _searchable = searchable;
    _trashed = trashed;
    _speciality = speciality;
    _specialityId = specialityId;
    _medical = medical;
    _organization = organization;
    _specialityAllowMultipleBooking = specialityAllowMultipleBooking;
    _allowOnlineBooking = allowOnlineBooking;
    _displayPaymentMeans = displayPaymentMeans;
    _paymentMeans = paymentMeans;
    _insuranceCard = insuranceCard;
    _regulationSector = regulationSector;
  }

  Profile.fromJson(dynamic json) {
    _link = json['link'];
    _cloudinaryPublicId = json['cloudinary_public_id'];
    _id = json['id'];
    _city = json['city'];
    _nameWithTitle = json['name_with_title'];
    _physicianIdentifier = json['physician_identifier'];
    _rpps = json['RPPS'];
    _title = json['title'];
    _ownerType = json['owner_type'];
    _bio = json['bio'];
    _searchable = json['searchable'];
    _trashed = json['trashed'];
    _speciality = json['speciality'];
    _specialityId = json['speciality_id'];
    _medical = json['medical'];
    _organization = json['organization'];
    _specialityAllowMultipleBooking = json['speciality_allow_multiple_booking'];
    _allowOnlineBooking = json['allow_online_booking'];
    _displayPaymentMeans = json['display_payment_means'];
    _paymentMeans = json['payment_means'] != null
        ? PaymentMeans.fromJson(json['paymentMeans'])
        : null;
    _insuranceCard = json['insurance_card'];
    _regulationSector = json['regulation_sector'];
  }
  String? _link;
  String? _cloudinaryPublicId;
  int? _id;
  String? _city;
  String? _nameWithTitle;
  String? _physicianIdentifier;
  String? _rpps;
  String? _title;
  String? _ownerType;
  String? _bio;
  bool? _searchable;
  bool? _trashed;
  String? _speciality;
  int? _specialityId;
  bool? _medical;
  bool? _organization;
  bool? _specialityAllowMultipleBooking;
  bool? _allowOnlineBooking;
  bool? _displayPaymentMeans;
  PaymentMeans? _paymentMeans;
  bool? _insuranceCard;
  String? _regulationSector;

  String? get link => _link;
  String? get cloudinaryPublicId => _cloudinaryPublicId;
  int? get id => _id;
  String? get city => _city;
  String? get nameWithTitle => _nameWithTitle;
  String? get physicianIdentifier => _physicianIdentifier;
  String? get rpps => _rpps;
  String? get title => _title;
  String? get ownerType => _ownerType;
  String? get bio => _bio;
  bool? get searchable => _searchable;
  bool? get trashed => _trashed;
  String? get speciality => _speciality;
  int? get specialityId => _specialityId;
  bool? get medical => _medical;
  bool? get organization => _organization;
  bool? get specialityAllowMultipleBooking => _specialityAllowMultipleBooking;
  bool? get allowOnlineBooking => _allowOnlineBooking;
  bool? get displayPaymentMeans => _displayPaymentMeans;
  PaymentMeans? get paymentMeans => _paymentMeans;
  bool? get insuranceCard => _insuranceCard;
  String? get regulationSector => _regulationSector;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = _link;
    map['cloudinary_public_id'] = _cloudinaryPublicId;
    map['id'] = _id;
    map['city'] = _city;
    map['name_with_title'] = _nameWithTitle;
    map['physician_identifier'] = _physicianIdentifier;
    map['RPPS'] = _rpps;
    map['title'] = _title;
    map['owner_type'] = _ownerType;
    map['bio'] = _bio;
    map['searchable'] = _searchable;
    map['trashed'] = _trashed;
    map['speciality'] = _speciality;
    map['speciality_id'] = _specialityId;
    map['medical'] = _medical;
    map['organization'] = _organization;
    map['speciality_allow_multiple_booking'] = _specialityAllowMultipleBooking;
    map['allow_online_booking'] = _allowOnlineBooking;
    map['display_payment_means'] = _displayPaymentMeans;
    if (_paymentMeans != null) {
      map['payment_means'] = _paymentMeans?.toJson();
    }
    map['insurance_card'] = _insuranceCard;
    map['regulation_sector'] = _regulationSector;
    return map;
  }
}
