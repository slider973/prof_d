// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'api_json.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDto {
  LoginDto({
    this.username,
    this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  @JsonKey(name: 'username', includeIfNull: true)
  final String? username;
  @JsonKey(name: 'password', includeIfNull: true)
  final String? password;
  static const fromJsonFactory = _$LoginDtoFromJson;
  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? username, String? password}) {
    return LoginDto(
        username: username ?? this.username,
        password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class AppleLoginDto {
  AppleLoginDto({
    this.name,
    this.accessToken,
    this.authorizationCode,
    this.type,
  });

  factory AppleLoginDto.fromJson(Map<String, dynamic> json) =>
      _$AppleLoginDtoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: true)
  final String? name;
  @JsonKey(name: 'accessToken', includeIfNull: true)
  final String? accessToken;
  @JsonKey(name: 'authorizationCode', includeIfNull: true)
  final String? authorizationCode;
  @JsonKey(name: 'type', includeIfNull: true)
  final String? type;
  static const fromJsonFactory = _$AppleLoginDtoFromJson;
  static const toJsonFactory = _$AppleLoginDtoToJson;
  Map<String, dynamic> toJson() => _$AppleLoginDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppleLoginDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.authorizationCode, authorizationCode) ||
                const DeepCollectionEquality()
                    .equals(other.authorizationCode, authorizationCode)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(authorizationCode) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppleLoginDtoExtension on AppleLoginDto {
  AppleLoginDto copyWith(
      {String? name,
      String? accessToken,
      String? authorizationCode,
      String? type}) {
    return AppleLoginDto(
        name: name ?? this.name,
        accessToken: accessToken ?? this.accessToken,
        authorizationCode: authorizationCode ?? this.authorizationCode,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterDto {
  RegisterDto({
    this.password,
    this.email,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  @JsonKey(name: 'password', includeIfNull: true)
  final String? password;
  @JsonKey(name: 'email', includeIfNull: true)
  final String? email;
  static const fromJsonFactory = _$RegisterDtoFromJson;
  static const toJsonFactory = _$RegisterDtoToJson;
  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterDto &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $RegisterDtoExtension on RegisterDto {
  RegisterDto copyWith({String? password, String? email}) {
    return RegisterDto(
        password: password ?? this.password, email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateEmailDto {
  UpdateEmailDto();

  factory UpdateEmailDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailDtoFromJson(json);

  static const fromJsonFactory = _$UpdateEmailDtoFromJson;
  static const toJsonFactory = _$UpdateEmailDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateEmailDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileDto {
  UpdateProfileDto();

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);

  static const fromJsonFactory = _$UpdateProfileDtoFromJson;
  static const toJsonFactory = _$UpdateProfileDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordDto {
  UpdatePasswordDto();

  factory UpdatePasswordDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordDtoFromJson(json);

  static const fromJsonFactory = _$UpdatePasswordDtoFromJson;
  static const toJsonFactory = _$UpdatePasswordDtoToJson;
  Map<String, dynamic> toJson() => _$UpdatePasswordDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class RecoverPasswordDto {
  RecoverPasswordDto();

  factory RecoverPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordDtoFromJson(json);

  static const fromJsonFactory = _$RecoverPasswordDtoFromJson;
  static const toJsonFactory = _$RecoverPasswordDtoToJson;
  Map<String, dynamic> toJson() => _$RecoverPasswordDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class RoomDto {
  RoomDto();

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);

  static const fromJsonFactory = _$RoomDtoFromJson;
  static const toJsonFactory = _$RoomDtoToJson;
  Map<String, dynamic> toJson() => _$RoomDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class DeleteDirectMessageDto {
  DeleteDirectMessageDto();

  factory DeleteDirectMessageDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteDirectMessageDtoFromJson(json);

  static const fromJsonFactory = _$DeleteDirectMessageDtoFromJson;
  static const toJsonFactory = _$DeleteDirectMessageDtoToJson;
  Map<String, dynamic> toJson() => _$DeleteDirectMessageDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class DeleteRoomMessageDto {
  DeleteRoomMessageDto();

  factory DeleteRoomMessageDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoomMessageDtoFromJson(json);

  static const fromJsonFactory = _$DeleteRoomMessageDtoFromJson;
  static const toJsonFactory = _$DeleteRoomMessageDtoToJson;
  Map<String, dynamic> toJson() => _$DeleteRoomMessageDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class AddChildDto {
  AddChildDto();

  factory AddChildDto.fromJson(Map<String, dynamic> json) =>
      _$AddChildDtoFromJson(json);

  static const fromJsonFactory = _$AddChildDtoFromJson;
  static const toJsonFactory = _$AddChildDtoToJson;
  Map<String, dynamic> toJson() => _$AddChildDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreateAddressDto {
  CreateAddressDto();

  factory CreateAddressDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressDtoFromJson(json);

  static const fromJsonFactory = _$CreateAddressDtoFromJson;
  static const toJsonFactory = _$CreateAddressDtoToJson;
  Map<String, dynamic> toJson() => _$CreateAddressDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdateAddressDto {
  UpdateAddressDto();

  factory UpdateAddressDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressDtoFromJson(json);

  static const fromJsonFactory = _$UpdateAddressDtoFromJson;
  static const toJsonFactory = _$UpdateAddressDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateAddressDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreateTimeTableDto {
  CreateTimeTableDto();

  factory CreateTimeTableDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTimeTableDtoFromJson(json);

  static const fromJsonFactory = _$CreateTimeTableDtoFromJson;
  static const toJsonFactory = _$CreateTimeTableDtoToJson;
  Map<String, dynamic> toJson() => _$CreateTimeTableDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdateTimeTableDto {
  UpdateTimeTableDto();

  factory UpdateTimeTableDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeTableDtoFromJson(json);

  static const fromJsonFactory = _$UpdateTimeTableDtoFromJson;
  static const toJsonFactory = _$UpdateTimeTableDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateTimeTableDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreateFollowUpDto {
  CreateFollowUpDto();

  factory CreateFollowUpDto.fromJson(Map<String, dynamic> json) =>
      _$CreateFollowUpDtoFromJson(json);

  static const fromJsonFactory = _$CreateFollowUpDtoFromJson;
  static const toJsonFactory = _$CreateFollowUpDtoToJson;
  Map<String, dynamic> toJson() => _$CreateFollowUpDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdateFollowUpDto {
  UpdateFollowUpDto();

  factory UpdateFollowUpDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateFollowUpDtoFromJson(json);

  static const fromJsonFactory = _$UpdateFollowUpDtoFromJson;
  static const toJsonFactory = _$UpdateFollowUpDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateFollowUpDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreateFollowUpDetailDto {
  CreateFollowUpDetailDto();

  factory CreateFollowUpDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CreateFollowUpDetailDtoFromJson(json);

  static const fromJsonFactory = _$CreateFollowUpDetailDtoFromJson;
  static const toJsonFactory = _$CreateFollowUpDetailDtoToJson;
  Map<String, dynamic> toJson() => _$CreateFollowUpDetailDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdateFollowUpDetailDto {
  UpdateFollowUpDetailDto();

  factory UpdateFollowUpDetailDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateFollowUpDetailDtoFromJson(json);

  static const fromJsonFactory = _$UpdateFollowUpDetailDtoFromJson;
  static const toJsonFactory = _$UpdateFollowUpDetailDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateFollowUpDetailDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreateAppointmentDto {
  CreateAppointmentDto({
    this.parent,
    this.to,
    this.date,
  });

  factory CreateAppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentDtoFromJson(json);

  @JsonKey(name: 'parent', includeIfNull: true)
  final String? parent;
  @JsonKey(name: 'to', includeIfNull: true)
  final String? to;
  @JsonKey(name: 'date', includeIfNull: true)
  final String? date;
  static const fromJsonFactory = _$CreateAppointmentDtoFromJson;
  static const toJsonFactory = _$CreateAppointmentDtoToJson;
  Map<String, dynamic> toJson() => _$CreateAppointmentDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateAppointmentDto &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(date) ^
      runtimeType.hashCode;
}

extension $CreateAppointmentDtoExtension on CreateAppointmentDto {
  CreateAppointmentDto copyWith({String? parent, String? to, String? date}) {
    return CreateAppointmentDto(
        parent: parent ?? this.parent,
        to: to ?? this.to,
        date: date ?? this.date);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateAppointmentDto {
  UpdateAppointmentDto();

  factory UpdateAppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppointmentDtoFromJson(json);

  static const fromJsonFactory = _$UpdateAppointmentDtoFromJson;
  static const toJsonFactory = _$UpdateAppointmentDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateAppointmentDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CreatePdfDto {
  CreatePdfDto();

  factory CreatePdfDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePdfDtoFromJson(json);

  static const fromJsonFactory = _$CreatePdfDtoFromJson;
  static const toJsonFactory = _$CreatePdfDtoToJson;
  Map<String, dynamic> toJson() => _$CreatePdfDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UpdatePdfDto {
  UpdatePdfDto();

  factory UpdatePdfDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePdfDtoFromJson(json);

  static const fromJsonFactory = _$UpdatePdfDtoFromJson;
  static const toJsonFactory = _$UpdatePdfDtoToJson;
  Map<String, dynamic> toJson() => _$UpdatePdfDtoToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
