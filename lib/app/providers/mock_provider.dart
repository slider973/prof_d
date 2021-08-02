import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import '../models/review_model.dart';
import '../models/alarm_model.dart';
import '../models/booking_model.dart';
import '../models/clinic_model.dart';
import '../models/faq_category_model.dart';
import '../models/notification_model.dart' as model;
import '../models/paramedic_model.dart';
import '../models/address_model.dart';
import '../models/doctor_model.dart';
import '../models/speciality_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/setting_model.dart';
import '../models/user_model.dart';
import '../services/global_service.dart';

class MockApiClient {
  final _globalService = Get.find<GlobalService>();

  String get baseUrl => _globalService.global.value.mockBaseUrl;

  final Dio httpClient;
  final Options _options = buildCacheOptions(Duration(days: 3), forceRefresh: true);

  MockApiClient({@required this.httpClient}) {
    httpClient.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }




  Future<Setting> getSettings() async {
    var response = await httpClient.get(baseUrl + "settings/all.json", options: _options);
    if (response.statusCode == 200) {
      return Setting.fromJson(response.data['data']);
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<User>> getAllUsers() async{
    var response = await httpClient.get(baseUrl + "users/all.json",options: _options);
    if (response.statusCode==200){
      return response.data['data'].map<User>((obj) => User.fromJson(obj)).toList();
    }else{
      throw new Exception(response.statusMessage);
    }
  }

  Future<User> getLogin() async{
    var response = await httpClient.get(baseUrl + "users/user.json",options: _options);
    if(response.statusCode==200){
      return User.fromJson(response.data['data']);
    }else{
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Address>> getAddresses() async {
    var response = await httpClient.get(baseUrl + "users/addresses.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Address>((obj) => Address.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Speciality>> getAllSpecialities() async {
    var response = await httpClient.get(baseUrl + "specialities/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Speciality>((obj) => Speciality.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<Doctor> getDoctor(String id) async {
    var response = await httpClient.get(baseUrl + "doctors/all.json", options: _options);
    if (response.statusCode == 200) {
      List<Doctor> _list = response.data['data'].map<Doctor>((obj) => Doctor.fromJson(obj)).toList();
      return _list.firstWhere((element) => element.id == id, orElse: () => new Doctor());
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Review>> getDoctorReviews() async {
    var response = await httpClient.get(baseUrl + "doctors/reviews.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Review>((obj) => Review.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Doctor>> getAllDoctors() async {
    var response = await httpClient.get(baseUrl + "doctors/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Doctor>((obj) => Doctor.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Doctor>> getTopDoctors() async {
    var response = await httpClient.get(baseUrl + "doctors/top.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Doctor>((obj) => Doctor.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Paramedic>> getAllParamedics() async {
    var response = await httpClient.get(baseUrl + "paramedics/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Paramedic>((obj) => Paramedic.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<Paramedic> getParamedicNearbyYou() async {
    var response = await httpClient.get(baseUrl + "paramedics/nearby-you.json", options: _options);
    if (response.statusCode == 200) {
      print(Paramedic.fromJson(response.data['data']).name);
      return Paramedic.fromJson(response.data['data']);
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Clinic>> getAllClinics() async {
    var response = await httpClient.get(baseUrl + "clinics/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Clinic>((obj) => Clinic.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Clinic>> getClinicsNearbyYou() async {
    var response = await httpClient.get(baseUrl + "clinics/nearby-you.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Clinic>((obj) => Clinic.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<Clinic> getClinic(String id) async {
    var response = await httpClient.get(baseUrl + "clinics/all.json", options: _options);
    if (response.statusCode == 200) {
      List<Clinic> _list = response.data['data'].map<Clinic>((obj) => Clinic.fromJson(obj)).toList();
      return _list.firstWhere((element) => element.id == id, orElse: () => new Clinic());
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Review>> getClinicReviews() async {
    var response = await httpClient.get(baseUrl + "clinics/reviews.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Review>((obj) => Review.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<model.Notification>> getNotifications() async {
    var response = await httpClient.get(baseUrl + "notifications/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<model.Notification>((obj) => model.Notification.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }
  Future<List<Alarm>> getAlarms() async {
    var response = await httpClient.get(baseUrl + "alarms/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Alarm>((obj) => Alarm.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<FaqCategory>> getCategoriesWithFaqs() async {
    var response = await httpClient.get(baseUrl + "help/faqs.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<FaqCategory>((obj) => FaqCategory.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Booking>> getBookings() async {
    var response = await httpClient.get(baseUrl + "bookings/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<Booking>((obj) => Booking.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }
}
