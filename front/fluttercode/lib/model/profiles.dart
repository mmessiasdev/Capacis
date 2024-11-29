class Profile {
  int? id;
  String? fname;
  String? lname;
  String? email;
  User? user;
  String? fullname;
  Plan? plan;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.fname,
      this.lname,
      this.email,
      this.user,
      this.fullname,
      this.plan,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    fullname = json['fullname'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['fullname'] = this.fullname;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  int? role;
  int? profile;
  String? cpf;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.profile,
      this.cpf,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'];
    profile = json['profile'];
    cpf = json['cpf'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['role'] = this.role;
    data['profile'] = this.profile;
    data['cpf'] = this.cpf;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? desc;
  double? value;
  String? benefits;
  String? rules;
  String? color;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Plan(
      {this.id,
      this.name,
      this.desc,
      this.value,
      this.benefits,
      this.rules,
      this.color,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    value = json['value'];
    benefits = json['benefits'];
    rules = json['rules'];
    color = json['color'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['value'] = this.value;
    data['benefits'] = this.benefits;
    data['rules'] = this.rules;
    data['color'] = this.color;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
