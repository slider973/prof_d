import 'api_json.models.swagger.dart';
import 'package:chopper/chopper.dart';
import 'dart:convert';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
export 'api_json.models.swagger.dart';

part 'api_json.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiJson extends ChopperService {
  static ApiJson create(
      {ChopperClient? client,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$ApiJson(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiJson()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        baseUrl: baseUrl ?? 'http://');
    return _$ApiJson(newClient);
  }

  ///
  Future<chopper.Response> $Get() {
    return _$Get();
  }

  ///
  @Get(path: '/')
  Future<chopper.Response> _$Get();

  ///
  Future<chopper.Response> testGet() {
    return _testGet();
  }

  ///
  @Get(path: '/test')
  Future<chopper.Response> _testGet();

  ///
  Future<chopper.Response> mailGet() {
    return _mailGet();
  }

  ///
  @Get(path: '/mail')
  Future<chopper.Response> _mailGet();

  ///
  Future<chopper.Response> authLoginPost({required LoginDto? body}) {
    return _authLoginPost(body: body);
  }

  ///
  @Post(path: '/auth/login')
  Future<chopper.Response> _authLoginPost({@Body() required LoginDto? body});

  ///
  Future<chopper.Response> authFacebookLoginPost() {
    return _authFacebookLoginPost();
  }

  ///
  @Post(path: '/auth/facebook-login', optionalBody: true)
  Future<chopper.Response> _authFacebookLoginPost();

  ///
  Future<chopper.Response> authGoogleLoginPost() {
    return _authGoogleLoginPost();
  }

  ///
  @Post(path: '/auth/google-login', optionalBody: true)
  Future<chopper.Response> _authGoogleLoginPost();

  ///
  Future<chopper.Response> authAppleLoginPost({required AppleLoginDto? body}) {
    return _authAppleLoginPost(body: body);
  }

  ///
  @Post(path: '/auth/apple-login')
  Future<chopper.Response> _authAppleLoginPost(
      {@Body() required AppleLoginDto? body});

  ///
  Future<chopper.Response> authRefreshTokenPost() {
    return _authRefreshTokenPost();
  }

  ///
  @Post(path: '/auth/refresh-token', optionalBody: true)
  Future<chopper.Response> _authRefreshTokenPost();

  ///
  Future<chopper.Response> authRegisterPost({required RegisterDto? body}) {
    return _authRegisterPost(body: body);
  }

  ///
  @Post(path: '/auth/register')
  Future<chopper.Response> _authRegisterPost(
      {@Body() required RegisterDto? body});

  ///
  Future<chopper.Response> authAppleCallbackPost() {
    return _authAppleCallbackPost();
  }

  ///
  @Post(path: '/auth/apple-callback', optionalBody: true)
  Future<chopper.Response> _authAppleCallbackPost();

  ///
  Future<chopper.Response> authLogoutFromAllDevicesDelete() {
    return _authLogoutFromAllDevicesDelete();
  }

  ///
  @Delete(path: '/auth/logout-from-all-devices')
  Future<chopper.Response> _authLogoutFromAllDevicesDelete();

  ///
  Future<chopper.Response> authMeGet() {
    return _authMeGet();
  }

  ///
  @Get(path: '/auth/me')
  Future<chopper.Response> _authMeGet();

  ///
  Future<chopper.Response> userGetParentListGet() {
    return _userGetParentListGet();
  }

  ///
  @Get(path: '/user/getParentList')
  Future<chopper.Response> _userGetParentListGet();

  ///
  ///@param username
  Future<chopper.Response> userUsernameGet({required String? username}) {
    return _userUsernameGet(username: username);
  }

  ///
  ///@param username
  @Get(path: '/user/{username}')
  Future<chopper.Response> _userUsernameGet(
      {@Path('username') required String? username});

  ///
  Future<chopper.Response> settingsUsernamePut() {
    return _settingsUsernamePut();
  }

  ///
  @Put(path: '/settings/username', optionalBody: true)
  Future<chopper.Response> _settingsUsernamePut();

  ///
  Future<chopper.Response> settingsEmailPut({required UpdateEmailDto? body}) {
    return _settingsEmailPut(body: body);
  }

  ///
  @Put(path: '/settings/email')
  Future<chopper.Response> _settingsEmailPut(
      {@Body() required UpdateEmailDto? body});

  ///
  Future<chopper.Response> settingsProfilePatch(
      {required UpdateProfileDto? body}) {
    return _settingsProfilePatch(body: body);
  }

  ///
  @Patch(path: '/settings/profile')
  Future<chopper.Response> _settingsProfilePatch(
      {@Body() required UpdateProfileDto? body});

  ///
  Future<chopper.Response> settingsPasswordPut(
      {required UpdatePasswordDto? body}) {
    return _settingsPasswordPut(body: body);
  }

  ///
  @Put(path: '/settings/password')
  Future<chopper.Response> _settingsPasswordPut(
      {@Body() required UpdatePasswordDto? body});

  ///
  Future<chopper.Response> subscriptionGet() {
    return _subscriptionGet();
  }

  ///
  @Get(path: '/subscription')
  Future<chopper.Response> _subscriptionGet();

  ///
  Future<chopper.Response> subscriptionWebPost() {
    return _subscriptionWebPost();
  }

  ///
  @Post(path: '/subscription/web', optionalBody: true)
  Future<chopper.Response> _subscriptionWebPost();

  ///
  Future<chopper.Response> subscriptionWebDelete() {
    return _subscriptionWebDelete();
  }

  ///
  @Delete(path: '/subscription/web')
  Future<chopper.Response> _subscriptionWebDelete();

  ///
  Future<chopper.Response> subscriptionMobilePost() {
    return _subscriptionMobilePost();
  }

  ///
  @Post(path: '/subscription/mobile', optionalBody: true)
  Future<chopper.Response> _subscriptionMobilePost();

  ///
  Future<chopper.Response> subscriptionMobileDelete() {
    return _subscriptionMobileDelete();
  }

  ///
  @Delete(path: '/subscription/mobile')
  Future<chopper.Response> _subscriptionMobileDelete();

  ///
  Future<chopper.Response> recoverCodeGet() {
    return _recoverCodeGet();
  }

  ///
  @Get(path: '/recover/{code}')
  Future<chopper.Response> _recoverCodeGet();

  ///
  Future<chopper.Response> recoverCodePost({required UpdatePasswordDto? body}) {
    return _recoverCodePost(body: body);
  }

  ///
  @Post(path: '/recover/{code}')
  Future<chopper.Response> _recoverCodePost(
      {@Body() required UpdatePasswordDto? body});

  ///
  Future<chopper.Response> recoverPost({required RecoverPasswordDto? body}) {
    return _recoverPost(body: body);
  }

  ///
  @Post(path: '/recover')
  Future<chopper.Response> _recoverPost(
      {@Body() required RecoverPasswordDto? body});

  ///
  Future<chopper.Response> notificationConfigGet() {
    return _notificationConfigGet();
  }

  ///
  @Get(path: '/notification/config')
  Future<chopper.Response> _notificationConfigGet();

  ///
  Future<chopper.Response> roomGet() {
    return _roomGet();
  }

  ///
  @Get(path: '/room')
  Future<chopper.Response> _roomGet();

  ///
  Future<chopper.Response> roomPost({required RoomDto? body}) {
    return _roomPost(body: body);
  }

  ///
  @Post(path: '/room')
  Future<chopper.Response> _roomPost({@Body() required RoomDto? body});

  ///
  ///@param id
  Future<chopper.Response> roomIdIdGet({required String? id}) {
    return _roomIdIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/room/id/{id}')
  Future<chopper.Response> _roomIdIdGet({@Path('id') required String? id});

  ///
  Future<chopper.Response> roomPublicGet() {
    return _roomPublicGet();
  }

  ///
  @Get(path: '/room/public')
  Future<chopper.Response> _roomPublicGet();

  ///
  Future<chopper.Response> roomMemberGet() {
    return _roomMemberGet();
  }

  ///
  @Get(path: '/room/member')
  Future<chopper.Response> _roomMemberGet();

  ///
  ///@param id
  Future<chopper.Response> roomDeleteIdDelete({required String? id}) {
    return _roomDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/room/delete/{id}')
  Future<chopper.Response> _roomDeleteIdDelete(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> roomIdPut(
      {required String? id, required RoomDto? body}) {
    return _roomIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(path: '/room/{id}')
  Future<chopper.Response> _roomIdPut(
      {@Path('id') required String? id, @Body() required RoomDto? body});

  ///
  Future<chopper.Response> roomJoinPost() {
    return _roomJoinPost();
  }

  ///
  @Post(path: '/room/join', optionalBody: true)
  Future<chopper.Response> _roomJoinPost();

  ///
  ///@param id
  Future<chopper.Response> roomLeaveIdDelete({required String? id}) {
    return _roomLeaveIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/room/leave/{id}')
  Future<chopper.Response> _roomLeaveIdDelete(
      {@Path('id') required String? id});

  ///
  ///@param userId
  Future<chopper.Response> messageDirectFirstMessageUserIdGet(
      {required String? userId}) {
    return _messageDirectFirstMessageUserIdGet(userId: userId);
  }

  ///
  ///@param userId
  @Get(path: '/message/direct-first-message/{userId}')
  Future<chopper.Response> _messageDirectFirstMessageUserIdGet(
      {@Path('userId') required String? userId});

  ///
  ///@param userId
  Future<chopper.Response> messageDirectUserIdGet({required String? userId}) {
    return _messageDirectUserIdGet(userId: userId);
  }

  ///
  ///@param userId
  @Get(path: '/message/direct/{userId}')
  Future<chopper.Response> _messageDirectUserIdGet(
      {@Path('userId') required String? userId});

  ///
  Future<chopper.Response> messageDirectDelete(
      {required DeleteDirectMessageDto? body}) {
    return _messageDirectDelete(body: body);
  }

  ///
  @Delete(path: '/message/direct')
  Future<chopper.Response> _messageDirectDelete(
      {@Body() required DeleteDirectMessageDto? body});

  ///
  Future<chopper.Response> messageDirectAllDelete(
      {required DeleteDirectMessageDto? body}) {
    return _messageDirectAllDelete(body: body);
  }

  ///
  @Delete(path: '/message/direct/all')
  Future<chopper.Response> _messageDirectAllDelete(
      {@Body() required DeleteDirectMessageDto? body});

  ///
  ///@param roomId
  Future<chopper.Response> messageRoomFirstMessageRoomIdGet(
      {required String? roomId}) {
    return _messageRoomFirstMessageRoomIdGet(roomId: roomId);
  }

  ///
  ///@param roomId
  @Get(path: '/message/room-first-message/{roomId}')
  Future<chopper.Response> _messageRoomFirstMessageRoomIdGet(
      {@Path('roomId') required String? roomId});

  ///
  ///@param roomId
  Future<chopper.Response> messageRoomRoomIdGet({required String? roomId}) {
    return _messageRoomRoomIdGet(roomId: roomId);
  }

  ///
  ///@param roomId
  @Get(path: '/message/room/{roomId}')
  Future<chopper.Response> _messageRoomRoomIdGet(
      {@Path('roomId') required String? roomId});

  ///
  Future<chopper.Response> messageRoomDelete(
      {required DeleteRoomMessageDto? body}) {
    return _messageRoomDelete(body: body);
  }

  ///
  @Delete(path: '/message/room')
  Future<chopper.Response> _messageRoomDelete(
      {@Body() required DeleteRoomMessageDto? body});

  ///
  Future<chopper.Response> messageRoomAllDelete(
      {required DeleteRoomMessageDto? body}) {
    return _messageRoomAllDelete(body: body);
  }

  ///
  @Delete(path: '/message/room/all')
  Future<chopper.Response> _messageRoomAllDelete(
      {@Body() required DeleteRoomMessageDto? body});

  ///
  ///@param id
  Future<chopper.Response> parentsFindChildByIdIdGet({required String? id}) {
    return _parentsFindChildByIdIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/parents/findChildById/{id}')
  Future<chopper.Response> _parentsFindChildByIdIdGet(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response> childAddChildToParentPost(
      {required AddChildDto? body}) {
    return _childAddChildToParentPost(body: body);
  }

  ///
  @Post(path: '/child/addChildToParent')
  Future<chopper.Response> _childAddChildToParentPost(
      {@Body() required AddChildDto? body});

  ///
  ///@param id
  Future<chopper.Response> childIdGet({required String? id}) {
    return _childIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/child/{id}')
  Future<chopper.Response> _childIdGet({@Path('id') required String? id});

  ///
  Future<chopper.Response> addressPost({required CreateAddressDto? body}) {
    return _addressPost(body: body);
  }

  ///
  @Post(path: '/address')
  Future<chopper.Response> _addressPost(
      {@Body() required CreateAddressDto? body});

  ///
  Future<chopper.Response> addressGet() {
    return _addressGet();
  }

  ///
  @Get(path: '/address')
  Future<chopper.Response> _addressGet();

  ///
  ///@param id
  Future<chopper.Response> addressIdGet({required String? id}) {
    return _addressIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/address/{id}')
  Future<chopper.Response> _addressIdGet({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> addressIdPatch(
      {required String? id, required UpdateAddressDto? body}) {
    return _addressIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/address/{id}')
  Future<chopper.Response> _addressIdPatch(
      {@Path('id') required String? id,
      @Body() required UpdateAddressDto? body});

  ///
  ///@param id
  Future<chopper.Response> addressIdDelete({required String? id}) {
    return _addressIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/address/{id}')
  Future<chopper.Response> _addressIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response> timeTablePost({required CreateTimeTableDto? body}) {
    return _timeTablePost(body: body);
  }

  ///
  @Post(path: '/time-table')
  Future<chopper.Response> _timeTablePost(
      {@Body() required CreateTimeTableDto? body});

  ///
  Future<chopper.Response> timeTableGet() {
    return _timeTableGet();
  }

  ///
  @Get(path: '/time-table')
  Future<chopper.Response> _timeTableGet();

  ///
  ///@param date
  Future<chopper.Response> timeTableFindByDateGet({String? date}) {
    return _timeTableFindByDateGet(date: date);
  }

  ///
  ///@param date
  @Get(path: '/time-table/findByDate')
  Future<chopper.Response> _timeTableFindByDateGet(
      {@Query('date') String? date});

  ///
  ///@param id
  Future<chopper.Response> timeTableIdGet({required String? id}) {
    return _timeTableIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/time-table/{id}')
  Future<chopper.Response> _timeTableIdGet({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> timeTableIdPatch(
      {required String? id, required UpdateTimeTableDto? body}) {
    return _timeTableIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/time-table/{id}')
  Future<chopper.Response> _timeTableIdPatch(
      {@Path('id') required String? id,
      @Body() required UpdateTimeTableDto? body});

  ///
  ///@param id
  Future<chopper.Response> timeTableIdDelete({required String? id}) {
    return _timeTableIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/time-table/{id}')
  Future<chopper.Response> _timeTableIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response> followUpPost({required CreateFollowUpDto? body}) {
    return _followUpPost(body: body);
  }

  ///
  @Post(path: '/follow-up')
  Future<chopper.Response> _followUpPost(
      {@Body() required CreateFollowUpDto? body});

  ///
  Future<chopper.Response> followUpGet() {
    return _followUpGet();
  }

  ///
  @Get(path: '/follow-up')
  Future<chopper.Response> _followUpGet();

  ///
  ///@param id
  Future<chopper.Response> followUpIdGet({required String? id}) {
    return _followUpIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/follow-up/{id}')
  Future<chopper.Response> _followUpIdGet({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> followUpIdPatch(
      {required String? id, required UpdateFollowUpDto? body}) {
    return _followUpIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/follow-up/{id}')
  Future<chopper.Response> _followUpIdPatch(
      {@Path('id') required String? id,
      @Body() required UpdateFollowUpDto? body});

  ///
  ///@param id
  Future<chopper.Response> followUpIdDelete({required String? id}) {
    return _followUpIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/follow-up/{id}')
  Future<chopper.Response> _followUpIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response> followUpDetailsPost(
      {required CreateFollowUpDetailDto? body}) {
    return _followUpDetailsPost(body: body);
  }

  ///
  @Post(path: '/follow-up-details')
  Future<chopper.Response> _followUpDetailsPost(
      {@Body() required CreateFollowUpDetailDto? body});

  ///
  Future<chopper.Response> followUpDetailsGet() {
    return _followUpDetailsGet();
  }

  ///
  @Get(path: '/follow-up-details')
  Future<chopper.Response> _followUpDetailsGet();

  ///
  ///@param id
  Future<chopper.Response> followUpDetailsIdGet({required String? id}) {
    return _followUpDetailsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/follow-up-details/{id}')
  Future<chopper.Response> _followUpDetailsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> followUpDetailsIdPatch(
      {required String? id, required UpdateFollowUpDetailDto? body}) {
    return _followUpDetailsIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/follow-up-details/{id}')
  Future<chopper.Response> _followUpDetailsIdPatch(
      {@Path('id') required String? id,
      @Body() required UpdateFollowUpDetailDto? body});

  ///
  ///@param id
  Future<chopper.Response> followUpDetailsIdDelete({required String? id}) {
    return _followUpDetailsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/follow-up-details/{id}')
  Future<chopper.Response> _followUpDetailsIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response> appointmentPost(
      {required CreateAppointmentDto? body}) {
    return _appointmentPost(body: body);
  }

  ///
  @Post(path: '/appointment')
  Future<chopper.Response> _appointmentPost(
      {@Body() required CreateAppointmentDto? body});

  ///
  Future<chopper.Response> appointmentGet() {
    return _appointmentGet();
  }

  ///
  @Get(path: '/appointment')
  Future<chopper.Response> _appointmentGet();

  ///
  ///@param id
  Future<chopper.Response> appointmentIdGet({required String? id}) {
    return _appointmentIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/appointment/{id}')
  Future<chopper.Response> _appointmentIdGet({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> appointmentIdPatch(
      {required String? id, required UpdateAppointmentDto? body}) {
    return _appointmentIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/appointment/{id}')
  Future<chopper.Response> _appointmentIdPatch(
      {@Path('id') required String? id,
      @Body() required UpdateAppointmentDto? body});

  ///
  ///@param id
  Future<chopper.Response> appointmentIdDelete({required String? id}) {
    return _appointmentIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/appointment/{id}')
  Future<chopper.Response> _appointmentIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response> pdfPost({required CreatePdfDto? body}) {
    return _pdfPost(body: body);
  }

  ///
  @Post(path: '/pdf')
  Future<chopper.Response> _pdfPost({@Body() required CreatePdfDto? body});

  ///
  ///@param id
  Future<chopper.Response> pdfReportChildIdGet({required String? id}) {
    return _pdfReportChildIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/pdf/report-child/{id}')
  Future<chopper.Response> _pdfReportChildIdGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> pdfIdGet({required String? id}) {
    return _pdfIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/pdf/{id}')
  Future<chopper.Response> _pdfIdGet({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> pdfIdPatch(
      {required String? id, required UpdatePdfDto? body}) {
    return _pdfIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/pdf/{id}')
  Future<chopper.Response> _pdfIdPatch(
      {@Path('id') required String? id, @Body() required UpdatePdfDto? body});

  ///
  ///@param id
  Future<chopper.Response> pdfIdDelete({required String? id}) {
    return _pdfIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/pdf/{id}')
  Future<chopper.Response> _pdfIdDelete({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response> mailIdGet({required String? id}) {
    return _mailIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/mail/{id}')
  Future<chopper.Response> _mailIdGet({@Path('id') required String? id});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
