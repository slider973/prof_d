import 'dart:ui';

import 'doctor_model.dart';
import 'parents/model.dart';
import '../../common/ui.dart';

class Speciality extends Model{
  String name;
  String description;
  String image;
  Color color;
  List<Doctor> doctors;

  Speciality({this.name,this.description,this.image,this.color,this.doctors});

  Speciality.fromJson(Map<String,dynamic>json){
    name = json['name'];
    description = json['description'];
    image = json['image'];
    color = Ui.parseColor(json['color'].toString()).withOpacity(1);
    if (json['doctors'] != null) {
      doctors = List<Doctor>();
      json['doctors'].forEach((v) {
        doctors.add(Doctor.fromJson(v));
      });
    }
  }

  @override
  Map<String, Speciality> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['color'] = this.color.toString();
    if (this.doctors != null) {
      data['doctors'] = this.doctors.map((v) => v.toJson()).toList();
    }
    return data;
  }

}