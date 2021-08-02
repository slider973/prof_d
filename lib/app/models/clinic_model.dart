import 'package:prof_b/app/models/parents/model.dart';

import 'media_model.dart';
import 'parents/media_list_model.dart';
import 'doctor_model.dart';
import 'review_model.dart';

class Clinic extends Model {
  String name;
  String phone;
  String about;
  String address;
  bool closed = true;
  double rate;
  List<Media> medias;
  List<Review> reviews;
  List<Doctor> doctors;
  int totalReviews;
  bool isFavorite;

  Clinic({
    this.about,
    this.address,
    this.closed,
    this.name,
    this.phone,
    this.rate,
    this.reviews,
    this.doctors,
    this.totalReviews,
    this.isFavorite,
  });
  Clinic.fromJson(Map<String,dynamic> json){
      name = json['name'];
      phone = json['phone'];
      rate = json['rate']?.toDouble();
      about = json['about'];
      address = json['address'];
      closed = json['closed'];
      if(json['reviews'] != null){
        reviews = List<Review>();
        json['reviews'].forEach((v){
          reviews.add(Review.fromJson(v));
        });
      }
      if(json['doctors'] != null){
        doctors = List<Doctor>();
        json['doctors'].forEach((v){
          doctors.add(Doctor.fromJson(v));
        });
      }
      totalReviews = json['totalReviews'];
      isFavorite = json['isFavorite'];
      medias = mediaListFromJson(json, 'media');
      super.fromJson(json);

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['rate'] = this.rate;
    data['about'] = this.about;
    data['address'] = this.address;
    data['available'] = this.closed;
    if(this.reviews != null){
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    if(this.doctors != null){
      data['doctors'] = this.doctors.map((v) => v.toJson()).toList();
    }
    data['totalReviews'] = this.totalReviews;
    data['isFavorite'] = this.isFavorite;

    return data;
  }

  String get firstImageUrl => this.medias?.first?.url ?? '';

  String get firstImageThumb => this.medias?.first?.thumb ?? '';

  String get firstImageIcon => this.medias?.first?.icon ?? '';

}
