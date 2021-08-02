import 'parents/media_model.dart';
import 'speciality_model.dart';
import 'review_model.dart';

class Doctor extends MediaModel {
  String about;
  String address;
  bool available;
  String name;
  String phone;
  double rate;
  List<Review> reviews;
  Speciality speciality;
  int totalReviews;
  bool verified;
  String experience;
  bool isFavorite;
  double booking_price;

  Doctor({
    this.about,
    this.address,
    this.available,
    this.name,
    this.phone,
    this.rate,
    this.reviews,
    this.speciality,
    this.totalReviews,
    this.verified,
    this.experience,
    this.isFavorite,
    this.booking_price,
  });
  Doctor.fromJson(Map<String,dynamic> json){
        id= json['id'];
        about = json['about'];
        address = json['address'];
        available = json['available'];
        name = json['name'];
        phone = json['phone'];
        rate = json['rate']?.toDouble();
        if(json['reviews'] != null){
          reviews = List<Review>();
          json['reviews'].forEach((v){
            reviews.add(Review.fromJson(v));
          });
        }
        speciality=json ['speciality'] != null ? Speciality.fromJson(json['speciality']) : null;
        totalReviews = json['total_reviews'];
        verified = json['verified'];
        experience = json['experience'];
        isFavorite = json['isFavorite'];
        booking_price = json['booking_price']?.toDouble();
        super.fromJson(json);

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['about'] = this.about;
    data['address'] = this.address;
    data['available'] = this.available;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['rate'] = this.rate;
    if(this.reviews != null){
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['speciality'] = this.speciality;
    data['total_reviews'] = this.totalReviews;
    data['verified'] = this.verified;
    data['experience'] = this.experience;
    data['isFavorite'] = this.isFavorite;
    data['booking_price'] = this.booking_price;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }

    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["thumb"] = mediaThumb;
    return map;
  }

  @override
  bool get hasData {
    return id != null && name != null && about != null;
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is Doctor &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              about == other.about &&
              phone == other.phone &&
              rate == other.rate &&
              isFavorite == other.isFavorite &&
              speciality == other.speciality &&
              reviews == other.reviews &&
              totalReviews == other.totalReviews &&
              address == other.address &&
              verified == other.verified &&
              experience == other.experience &&
              booking_price == other.booking_price &&
              available == other.available;


  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ name.hashCode ^ about.hashCode ^ rate.hashCode ^ phone.hashCode ^ rate.hashCode ^ isFavorite.hashCode ^ speciality.hashCode
      ^ reviews.hashCode ^ totalReviews.hashCode ^ address.hashCode ^ verified.hashCode ^ experience.hashCode ^ booking_price.hashCode ^ available.hashCode;

}
