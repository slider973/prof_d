import 'invoices.dart';

class UserModel {
  final String email;
  final String? name;
  final String? phone;
  final String? image;
  final String? token;
  final String? firstname;
  final String? lastname;
  final bool? online;
  final bool? isProfileCreated;
  final String? role;
  final String? username;
  final String? id;
  List<Invoice?>? invoices;

  UserModel(
      {required this.email,
      required this.name,
      required this.phone,
      required this.image,
      required this.token,
      required this.firstname,
      required this.lastname,
      required this.online,
      required this.isProfileCreated,
      required this.role,
      required this.username,
      required this.id,
      required this.invoices});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name ?? '',
      'phone': phone ?? '',
      'image': image ?? '',
      'firstname': firstname ?? '',
      'lastname': lastname ?? '',
      'token': token ?? '',
      'online': online ?? false,
      'role': role ?? '',
      'username': username ?? '',
      'id': id ?? ''
    }..removeWhere((key, value) => value == null);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final invoices = <Invoice>[];
    if (map['invoices'] != null) {
      map['invoices'].forEach((v) {
        invoices.add(Invoice.fromJson(v));
      });
    }
    return UserModel(
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        firstname: map['firstname'] ?? '',
        lastname: map['lastname'] ?? '',
        phone: map['phone'] ?? '',
        image: map['image'] ?? '',
        isProfileCreated: map['isProfileCreated'] ?? false,
        token: map['token'] ?? '',
        online: map['online'] ?? '',
        role: map['role'] ?? '',
        username: map['username'] ?? '',
        invoices: invoices,
        id: map['id'] ?? '');
  }

  UserModel copyWith({
    String? uId,
    String? name,
    String? email,
    String? image,
    String? phone,
    String? token,
    String? firstname,
    String? lastname,
    String? online,
    bool? isProfileCreated,
    String? role,
    String? id,
    String? username,
    List<Invoice?>? invoices
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        image: image ?? this.image,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        isProfileCreated: isProfileCreated ?? this.isProfileCreated,
        token: token ?? this.token,
        online: online != null ? this.online : false,
        role: token ?? this.role,
        id: id ?? this.id,
        username: username ?? this.username,
        invoices: invoices ?? invoices);
  }

  @override
  String toString() {
    return '{email: $email, '
        'name: $name, '
        'firstname: $firstname, '
        'lastname: $lastname, '
        'phone: $phone, '
        'image: $image, '
        'token: $token,  '
        'online: $online, '
        'role: $role, '
        'username: $username, '
        'isProfileCreated: $isProfileCreated}'
        'invoices: $invoices'
        '}';
  }
}
