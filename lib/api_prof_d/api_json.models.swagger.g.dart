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

AddChildDto _$AddChildDtoFromJson(Map<String, dynamic> json) => AddChildDto();

Map<String, dynamic> _$AddChildDtoToJson(AddChildDto instance) =>
    <String, dynamic>{};

CreateAddressDto _$CreateAddressDtoFromJson(Map<String, dynamic> json) =>
    CreateAddressDto();

Map<String, dynamic> _$CreateAddressDtoToJson(CreateAddressDto instance) =>
    <String, dynamic>{};

UpdateAddressDto _$UpdateAddressDtoFromJson(Map<String, dynamic> json) =>
    UpdateAddressDto();

Map<String, dynamic> _$UpdateAddressDtoToJson(UpdateAddressDto instance) =>
    <String, dynamic>{};

CreateTimeTableDto _$CreateTimeTableDtoFromJson(Map<String, dynamic> json) =>
    CreateTimeTableDto();

Map<String, dynamic> _$CreateTimeTableDtoToJson(CreateTimeTableDto instance) =>
    <String, dynamic>{};

UpdateTimeTableDto _$UpdateTimeTableDtoFromJson(Map<String, dynamic> json) =>
    UpdateTimeTableDto();

Map<String, dynamic> _$UpdateTimeTableDtoToJson(UpdateTimeTableDto instance) =>
    <String, dynamic>{};

CreateFollowUpDto _$CreateFollowUpDtoFromJson(Map<String, dynamic> json) =>
    CreateFollowUpDto();

Map<String, dynamic> _$CreateFollowUpDtoToJson(CreateFollowUpDto instance) =>
    <String, dynamic>{};

UpdateFollowUpDto _$UpdateFollowUpDtoFromJson(Map<String, dynamic> json) =>
    UpdateFollowUpDto();

Map<String, dynamic> _$UpdateFollowUpDtoToJson(UpdateFollowUpDto instance) =>
    <String, dynamic>{};

CreateFollowUpDetailDto _$CreateFollowUpDetailDtoFromJson(
        Map<String, dynamic> json) =>
    CreateFollowUpDetailDto();

Map<String, dynamic> _$CreateFollowUpDetailDtoToJson(
        CreateFollowUpDetailDto instance) =>
    <String, dynamic>{};

UpdateFollowUpDetailDto _$UpdateFollowUpDetailDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateFollowUpDetailDto();

Map<String, dynamic> _$UpdateFollowUpDetailDtoToJson(
        UpdateFollowUpDetailDto instance) =>
    <String, dynamic>{};

CreateAppointmentDto _$CreateAppointmentDtoFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentDto(
      parent: json['parent'] as String?,
      to: json['to'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CreateAppointmentDtoToJson(
        CreateAppointmentDto instance) =>
    <String, dynamic>{
      'parent': instance.parent,
      'to': instance.to,
      'date': instance.date,
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
