import 'appointment_rules.dart';
import 'practice.dart';
import 'profile.dart';

class Confirmed {
  Confirmed({
    dynamic substituteName,
    dynamic substitutionWording,
    int? createdBy,
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    bool? branding,
    bool? confirmed,
    bool? canceled,
    bool? suspended,
    bool? isMovable,
    bool? cancelable = true,
    bool? tooLateToCancel = false,
    String? phoneNumber,
    String? source,
    bool? showPatient,
    bool? past,
    bool? patientCanShareDocuments: true,
    bool? noShow,
    int? agendaId,
    dynamic ehrSession,
    Profile? profile,
    List<dynamic>? documents,
    Practice? practice,
    List<AppointmentRules>? appointmentRules,
    String? country,

    dynamic documentCount,}){
    _substituteName = substituteName;
    _substitutionWording = substitutionWording;
    _createdBy = createdBy;
    _id = id;
    _startDate = startDate;
    _endDate = endDate;
    _branding = branding;
    _confirmed = confirmed;
    _canceled = canceled;
    _suspended = suspended;
    _isMovable = isMovable;
    _cancelable = cancelable;
    _tooLateToCancel = tooLateToCancel;
    _phoneNumber = phoneNumber;
    _source = source;
    _showPatient = showPatient;
    _past = past;
    _patientCanShareDocuments = patientCanShareDocuments;
    _noShow = noShow;
    _agendaId = agendaId;
    _ehrSession = ehrSession;
    _profile = profile;
    _documents = documents;
    _practice = practice;
    _appointmentRules = appointmentRules;
    _country = country;
    _documentCount = documentCount;
  }

  Confirmed.fromJson(dynamic json) {

    _substituteName = json['substitute_name'];
    _substitutionWording = json['substitution_wording'];
    _createdBy = json['created_by'];
    _id = json['id'];
    print('start_date ${json['start_date']}');
    _startDate = json['start_date'] != null ? DateTime.parse(json['start_date']) : DateTime.now();
    _endDate = json['end_date'] != null ? DateTime.parse(json['end_date']) : DateTime.now() ;
    _branding = json['branding'];
    _confirmed = json['confirmed'];
    _canceled = json['canceled'];
    _suspended = json['suspended'];
    _isMovable = json['is_movable'];
    _cancelable = json['cancelable'];
    _tooLateToCancel = json['too_late_to_cancel'];
    _phoneNumber = json['phone_number'];
    _source = json['source'];
    _showPatient = json['show_patient'];
    _past = json['past'];
    _patientCanShareDocuments = json['patient_can_share_documents'];
    _noShow = json['no_show'];
    _agendaId = json['agenda_id'];
    _ehrSession = json['ehr_session'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    _practice = json['practice'] != null ? Practice.fromJson(json['practice']) : null;
    if (json['appointment_rules'] != null) {
      _appointmentRules = [];
      json['appointment_rules'].forEach((v) {
        _appointmentRules?.add(AppointmentRules.fromJson(v));
      });
    }
    _country = json['country'];
    _documentCount = json['document_count'];
  }
  dynamic _substituteName;
  dynamic _substitutionWording;
  int? _createdBy;
  String? _id;
  DateTime? _startDate;
  DateTime? _endDate;
  bool? _branding;
  bool? _confirmed;
  bool? _canceled;
  bool? _suspended;
  bool? _isMovable;
  bool? _cancelable;
  bool? _tooLateToCancel;
  String? _phoneNumber;
  String? _source;
  bool? _showPatient;
  bool? _past;
  bool? _patientCanShareDocuments;
  bool? _noShow;
  int? _agendaId;
  dynamic _ehrSession;
  Profile? _profile;
  List<dynamic>? _documents;
  Practice? _practice;
  List<AppointmentRules>? _appointmentRules;
  String? _country;
  dynamic _documentCount;

  dynamic get substituteName => _substituteName;
  dynamic get substitutionWording => _substitutionWording;
  int? get createdBy => _createdBy;
  String? get id => _id;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  bool? get branding => _branding;
  bool? get confirmed => _confirmed;
  bool? get canceled => _canceled;
  bool? get suspended => _suspended;
  bool? get isMovable => _isMovable;
  bool? get cancelable => _cancelable;
  bool? get tooLateToCancel => _tooLateToCancel;
  String? get phoneNumber => _phoneNumber;
  String? get source => _source;
  bool? get showPatient => _showPatient;
  bool? get past => _past;
  bool? get patientCanShareDocuments => _patientCanShareDocuments;
  bool? get noShow => _noShow;
  int? get agendaId => _agendaId;
  dynamic get ehrSession => _ehrSession;
  Profile? get profile => _profile;
  List<dynamic>? get documents => _documents;
  Practice? get practice => _practice;
  List<AppointmentRules>? get appointmentRules => _appointmentRules;
  String? get country => _country;
  dynamic get documentCount => _documentCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['substitute_name'] = _substituteName;
    map['substitution_wording'] = _substitutionWording;
    map['created_by'] = _createdBy;
    map['id'] = _id;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['branding'] = _branding;
    map['confirmed'] = _confirmed;
    map['canceled'] = _canceled;
    map['suspended'] = _suspended;
    map['is_movable'] = _isMovable;
    map['cancelable'] = _cancelable;
    map['too_late_to_cancel'] = _tooLateToCancel;
    map['phone_number'] = _phoneNumber;
    map['source'] = _source;
    map['show_patient'] = _showPatient;
    map['past'] = _past;
    map['patient_can_share_documents'] = _patientCanShareDocuments;
    map['no_show'] = _noShow;
    map['agenda_id'] = _agendaId;
    map['ehr_session'] = _ehrSession;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    if (_documents != null) {
      map['documents'] = _documents?.map((v) => v.toJson()).toList();
    }
    if (_practice != null) {
      map['practice'] = _practice?.toJson();
    }
    if (_appointmentRules != null) {
      map['appointment_rules'] = _appointmentRules?.map((v) => v.toJson()).toList();
    }
    map['country'] = _country;

    map['document_count'] = _documentCount;
    return map;
  }

}