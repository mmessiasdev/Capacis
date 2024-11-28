import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? fullName;

  User({
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.fullName,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['fullName'] = this.fullName;
    return data;
  }
}
