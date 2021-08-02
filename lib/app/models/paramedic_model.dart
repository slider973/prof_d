import 'parents/media_model.dart';
import 'address_model.dart';

class Paramedic extends MediaModel {
  String name;
  String phone;
  bool available;
  Address address;

  Paramedic({this.name, this.phone, this.available, this.address});

  Paramedic.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      phone = json['phone'];
      available = json['available'];
      address = json['address'];
    } catch (e) {
      print(e);
      print(json['id']);
    }
  }
  @override
  Map<String, Paramedic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['available'] = this.available;
    data['address'] = this.address;

    return data;
  }
}
