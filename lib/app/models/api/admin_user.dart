class AdminUser {
  AdminUser({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.v,
    this.adminUserId,
  });

  String id;
  dynamic username;
  String firstname;
  String lastname;
  int v;
  String adminUserId;

  factory AdminUser.fromJson(Map<String, dynamic> json) => AdminUser(
    id: json["_id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    v: json["__v"],
    adminUserId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "__v": v,
    "id": adminUserId,
  };
}