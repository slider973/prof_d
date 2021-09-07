import 'role_model.dart';

class UserStrapi {
  UserStrapi({
    this.confirmed,
    this.blocked,
    this.id,
    this.username,
    this.email,
    this.firstname,
    this.name,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.isParent,
    this.appointments,
    this.userId,
  });

  bool confirmed;
  bool blocked;
  String id;
  String username;
  String email;
  String firstname;
  String name;
  String provider;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Role role;
  bool isParent;
  List<dynamic> appointments;
  String userId;

  factory UserStrapi.fromJson(Map<String, dynamic> json) => UserStrapi(
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        firstname: json["firstname"],
        name: json["name"],
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        role: Role.fromJson(json["role"]),
        isParent: json["isParent"],
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "username": username,
        "email": email,
        "firstname": firstname,
        "name": name,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role.toJson(),
        "isParent": isParent,
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
        "id": userId,
      };
}
