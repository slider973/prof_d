import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'parents/model.dart';

class Address extends Model {
  String id;
  String description;
  String address;
  double latitude;
  double longitude;
  bool isDefault;
  String userId;
  String street;
  String postcode;
  String locality;
  String country;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String addressId;

  Address(
      {this.id,
      this.description,
      this.address,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.userId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    address = json['address'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
    isDefault = json['isDefault'];
    userId = json['userId'];
    street = json["street"];
    postcode = json["postcode"];
    locality = json["locality"];
    country = json["country"];
    publishedAt = DateTime.parse(json["published_at"]);
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
    v = json["__v"];
    addressId = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isDefault'] = this.isDefault;
    data['userId'] = this.userId;
    data['street'] = this.street;
    data['postcode'] = this.postcode;
    data['locality'] = this.locality;
    data['country'] = this.country;
    data['published_at'] = this.publishedAt.toIso8601String();
    data['createdAt'] = this.createdAt.toIso8601String();
    data['updatedAt'] = this.updatedAt.toIso8601String();
    data['__v'] = this.v;
    return data;
  }

  bool isUnknown() {
    return latitude == null || longitude == null;
  }

  LatLng getLatLng() {
    if (this.isUnknown()) {
      return LatLng(40.4, 7);
    } else {
      return LatLng(this.latitude, this.longitude);
    }
  }
}
