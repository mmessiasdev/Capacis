class CoursesModel {
  int? id;
  String? title;
  String? desc;
  String? nivel;
  int? time;
  Enterprise? enterprise;
  String? urlbanner;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  List<Videos>? videos;

  CoursesModel(
      {this.id,
      this.title,
      this.desc,
      this.nivel,
      this.time,
      this.enterprise,
      this.urlbanner,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.videos});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    nivel = json['nivel'];
    time = json['time'];
    enterprise = json['enterprise'] != null
        ? new Enterprise.fromJson(json['enterprise'])
        : null;
    urlbanner = json['urlbanner'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['nivel'] = this.nivel;
    data['time'] = this.time;
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise!.toJson();
    }
    data['urlbanner'] = this.urlbanner;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enterprise {
  int? id;
  String? desc;
  int? profile;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Enterprise(
      {this.id,
      this.desc,
      this.profile,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  Enterprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desc = json['desc'];
    profile = json['profile'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desc'] = this.desc;
    data['profile'] = this.profile;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Videos {
  int? id;
  String? name;
  String? desc;
  String? url;
  Null? time;
  Null? public;
  int? course;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Videos(
      {this.id,
      this.name,
      this.desc,
      this.url,
      this.time,
      this.public,
      this.course,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    url = json['url'];
    time = json['time'];
    public = json['public'];
    course = json['course'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['url'] = this.url;
    data['time'] = this.time;
    data['public'] = this.public;
    data['course'] = this.course;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
