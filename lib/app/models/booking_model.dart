import 'address_model.dart';
import 'doctor_model.dart';
import 'parents/model.dart';
import 'payment_method.dart';
import 'user_model.dart';

class Booking extends Model {
  String id;
  DateTime dateTime;
  String description;
  String status;
  String progress;
  double total;
  double tax;
  double rate;
  User user;
  Doctor doctor;
  Address address;
  PaymentMethod paymentMethod;

  Booking({this.id, this.dateTime, this.description, this.status, this.progress, this.total, this.tax, this.rate, this.user, this.doctor, this.address, this.paymentMethod});

  Booking.fromJson(Map<String, dynamic> json) {
    dateTime = DateTime.parse(json['date_time']);
    description = json['description'];
    status = json['status'];
    progress = json['progress'];
    total = json['total']?.toDouble();
    rate = json['rate']?.toDouble();
    tax = json['tax']?.toDouble();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    paymentMethod = json['payment_method'] != null ? PaymentMethod.fromJson(json['payment_method']) : null;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['date_time'] = this.dateTime;
    data['description'] = this.description;
    data['status'] = this.status;
    data['progress'] = this.progress;
    data['total'] = this.total;
    data['tax'] = this.tax;
    data['rate'] = this.rate;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor.toJson();
    }
    return data;
  }

  @override
  bool get hasData {
    return id != null && description != null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is Booking &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              description == other.description &&
              rate == other.rate &&
              dateTime == other.dateTime &&
              status == other.status &&
              progress == other.progress &&
              total == other.total &&
              tax == other.tax &&
              user == other.user &&
              doctor == other.doctor &&
              address == other.address &&
              paymentMethod == other.paymentMethod ;


  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ description.hashCode ^ rate.hashCode ^ dateTime.hashCode ^ status.hashCode ^ progress.hashCode ^ total.hashCode ^ tax.hashCode ^ user.hashCode ^ doctor.hashCode ^ address.hashCode ^ paymentMethod.hashCode ;

}
