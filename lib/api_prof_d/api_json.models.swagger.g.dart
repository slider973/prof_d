// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_json.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

AppleLoginDto _$AppleLoginDtoFromJson(Map<String, dynamic> json) =>
    AppleLoginDto(
      name: json['name'] as String?,
      accessToken: json['accessToken'] as String?,
      authorizationCode: json['authorizationCode'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AppleLoginDtoToJson(AppleLoginDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accessToken': instance.accessToken,
      'authorizationCode': instance.authorizationCode,
      'type': instance.type,
    };

RefreshTokenDto _$RefreshTokenDtoFromJson(Map<String, dynamic> json) =>
    RefreshTokenDto(
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshTokenDtoToJson(RefreshTokenDto instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => RegisterDto(
      password: json['password'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$RegisterDtoToJson(RegisterDto instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };

UpdateEmailDto _$UpdateEmailDtoFromJson(Map<String, dynamic> json) =>
    UpdateEmailDto();

Map<String, dynamic> _$UpdateEmailDtoToJson(UpdateEmailDto instance) =>
    <String, dynamic>{};

UpdateProfileDto _$UpdateProfileDtoFromJson(Map<String, dynamic> json) =>
    UpdateProfileDto();

Map<String, dynamic> _$UpdateProfileDtoToJson(UpdateProfileDto instance) =>
    <String, dynamic>{};

UpdatePasswordDto _$UpdatePasswordDtoFromJson(Map<String, dynamic> json) =>
    UpdatePasswordDto();

Map<String, dynamic> _$UpdatePasswordDtoToJson(UpdatePasswordDto instance) =>
    <String, dynamic>{};

RecoverPasswordDto _$RecoverPasswordDtoFromJson(Map<String, dynamic> json) =>
    RecoverPasswordDto();

Map<String, dynamic> _$RecoverPasswordDtoToJson(RecoverPasswordDto instance) =>
    <String, dynamic>{};

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => RoomDto();

Map<String, dynamic> _$RoomDtoToJson(RoomDto instance) => <String, dynamic>{};

DeleteDirectMessageDto _$DeleteDirectMessageDtoFromJson(
        Map<String, dynamic> json) =>
    DeleteDirectMessageDto();

Map<String, dynamic> _$DeleteDirectMessageDtoToJson(
        DeleteDirectMessageDto instance) =>
    <String, dynamic>{};

DeleteRoomMessageDto _$DeleteRoomMessageDtoFromJson(
        Map<String, dynamic> json) =>
    DeleteRoomMessageDto();

Map<String, dynamic> _$DeleteRoomMessageDtoToJson(
        DeleteRoomMessageDto instance) =>
    <String, dynamic>{};

AddChildDto _$AddChildDtoFromJson(Map<String, dynamic> json) => AddChildDto(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      numberOfBrotherAndSister:
          (json['numberOfBrotherAndSister'] as num?)?.toDouble(),
      placeInTheSiblingGroup: json['placeInTheSiblingGroup'] as String?,
      placeOfSchooling: json['placeOfSchooling'] as String?,
      classLevel: json['classLevel'] as String?,
      followUpsInProgress: json['followUpsInProgress'] as String?,
      identifiedDisordersAndOrDifficulties:
          json['identifiedDisordersAndOrDifficulties'] as String?,
      arrangementsInTheClassroom: json['arrangementsInTheClassroom'] as String?,
      behaviourInTheHome: json['behaviourInTheHome'] as String?,
    );

Map<String, dynamic> _$AddChildDtoToJson(AddChildDto instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'numberOfBrotherAndSister': instance.numberOfBrotherAndSister,
      'placeInTheSiblingGroup': instance.placeInTheSiblingGroup,
      'placeOfSchooling': instance.placeOfSchooling,
      'classLevel': instance.classLevel,
      'followUpsInProgress': instance.followUpsInProgress,
      'identifiedDisordersAndOrDifficulties':
          instance.identifiedDisordersAndOrDifficulties,
      'arrangementsInTheClassroom': instance.arrangementsInTheClassroom,
      'behaviourInTheHome': instance.behaviourInTheHome,
    };

CreateAddressDto _$CreateAddressDtoFromJson(Map<String, dynamic> json) =>
    CreateAddressDto();

Map<String, dynamic> _$CreateAddressDtoToJson(CreateAddressDto instance) =>
    <String, dynamic>{};

UpdateAddressDto _$UpdateAddressDtoFromJson(Map<String, dynamic> json) =>
    UpdateAddressDto();

Map<String, dynamic> _$UpdateAddressDtoToJson(UpdateAddressDto instance) =>
    <String, dynamic>{};

CreateTimeTableDto _$CreateTimeTableDtoFromJson(Map<String, dynamic> json) =>
    CreateTimeTableDto(
      title: json['title'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$CreateTimeTableDtoToJson(CreateTimeTableDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'desc': instance.desc,
    };

UpdateTimeTableDto _$UpdateTimeTableDtoFromJson(Map<String, dynamic> json) =>
    UpdateTimeTableDto();

Map<String, dynamic> _$UpdateTimeTableDtoToJson(UpdateTimeTableDto instance) =>
    <String, dynamic>{};

CreateFollowUpDto _$CreateFollowUpDtoFromJson(Map<String, dynamic> json) =>
    CreateFollowUpDto(
      stateBefore: json['stateBefore'] as String?,
      stateAfter: json['stateAfter'] as String?,
      child: json['child'] as String?,
    );

Map<String, dynamic> _$CreateFollowUpDtoToJson(CreateFollowUpDto instance) =>
    <String, dynamic>{
      'stateBefore': instance.stateBefore,
      'stateAfter': instance.stateAfter,
      'child': instance.child,
    };

CreateFollowUpDetailDto _$CreateFollowUpDetailDtoFromJson(
        Map<String, dynamic> json) =>
    CreateFollowUpDetailDto(
      appointment: json['appointment'] as String?,
      followUpSubjects: (json['followUpSubjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateFollowUpDetailDtoToJson(
        CreateFollowUpDetailDto instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
      'followUpSubjects': instance.followUpSubjects,
    };

CreateAppointmentDto _$CreateAppointmentDtoFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentDto(
      patient: json['patient'] as String?,
      profile: json['profile'] as String?,
      timeTableId: json['timeTableId'] as String?,
    );

Map<String, dynamic> _$CreateAppointmentDtoToJson(
        CreateAppointmentDto instance) =>
    <String, dynamic>{
      'patient': instance.patient,
      'profile': instance.profile,
      'timeTableId': instance.timeTableId,
    };

UpdateAppointmentDto _$UpdateAppointmentDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateAppointmentDto();

Map<String, dynamic> _$UpdateAppointmentDtoToJson(
        UpdateAppointmentDto instance) =>
    <String, dynamic>{};

CreatePdfDto _$CreatePdfDtoFromJson(Map<String, dynamic> json) =>
    CreatePdfDto();

Map<String, dynamic> _$CreatePdfDtoToJson(CreatePdfDto instance) =>
    <String, dynamic>{};

UpdatePdfDto _$UpdatePdfDtoFromJson(Map<String, dynamic> json) =>
    UpdatePdfDto();

Map<String, dynamic> _$UpdatePdfDtoToJson(UpdatePdfDto instance) =>
    <String, dynamic>{};

CreateFollowUpSubjectDto _$CreateFollowUpSubjectDtoFromJson(
        Map<String, dynamic> json) =>
    CreateFollowUpSubjectDto(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateFollowUpSubjectDtoToJson(
        CreateFollowUpSubjectDto instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
