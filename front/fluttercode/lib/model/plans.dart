class Plans {
  int? id;
  String? name;
  String? desc;
  String? benefits;
  String? rules;
  double? value;
  String? color;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  List<Null>? profiles;

  Plans({
    this.id,
    this.name,
    this.desc,
    this.benefits,
    this.rules,
    this.value,
    this.color,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.profiles,
  });

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    benefits = json['benefits'];
    rules = json['rules'];
    value = json['value'];
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
    data['benefits'] = this.benefits;
    data['rules'] = this.rules;
    data['value'] = this.value;
    data['color'] = this.color;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
