class StoresModel {
  int? id;
  String? name;
  String? desc;
  String? afflink;
  int? percentcashback;
  String? logourl;
  String? createdAt;
  String? updatedAt;
  List<Categories>? categories;

  StoresModel(
      {this.id,
      this.name,
      this.desc,
      this.afflink,
      this.percentcashback,
      this.logourl,
      this.createdAt,
      this.updatedAt,
      this.categories});

  StoresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    afflink = json['afflink'];
    percentcashback = json['percentcashback'];
    logourl = json['logourl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['afflink'] = this.afflink;
    data['percentcashback'] = this.percentcashback;
    data['logourl'] = this.logourl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  int? onlineStore;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id, this.name, this.onlineStore, this.createdAt, this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    onlineStore = json['online_store'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['online_store'] = this.onlineStore;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
