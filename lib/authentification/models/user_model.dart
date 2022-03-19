import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final String? name;
  final String? phone;
  final String? image;
  final String? token;
  final bool? online;
  final bool? isProfileCreated;
  final String? role;
  final String? username;
  final String? id;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
    required this.token,
    required this.online,
    required this.isProfileCreated,
    required this.role,
    required this.username,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name ?? '',
      'phone': phone ?? '',
      'image': image ?? '',
      'token': token ?? '',
      'online': online ?? false,
      'role': role ?? '',
      'username': username ?? '',
      'id': id ?? ''
    }..removeWhere((key, value) => value == null);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        phone: map['phone'] ?? '',
        image: map['image'] ?? '',
        isProfileCreated: map['isProfileCreated'] ?? false,
        token: map['token'] ?? '',
        online: map['online'] ?? '',
        role: map['role'] ?? '',
        username: map['username'] ?? '',
        id: map['id'] ?? '');
  }

  UserModel copyWith({
    String? uId,
    String? name,
    String? email,
    String? image,
    String? phone,
    String? token,
    String? online,
    bool? isProfileCreated,
    String? role,
    String? id,
    String? username,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      isProfileCreated: isProfileCreated ?? this.isProfileCreated,
      token: token ?? this.token,
      online: online != null ? this.online : false,
      role: token ?? this.role,
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }
}
