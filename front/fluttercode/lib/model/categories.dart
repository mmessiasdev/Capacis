class CategoryModel {
  int? id;
  String? name;
  String? illustrationurl;
  String? createdAt;
  String? updatedAt;
  List<OnlineStores>? onlineStores;

  CategoryModel(
      {this.id,
      this.name,
      this.illustrationurl,
      this.createdAt,
      this.updatedAt,
      this.onlineStores});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    illustrationurl = json['illustrationurl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['online_stores'] != null) {
      onlineStores = <OnlineStores>[];
      json['online_stores'].forEach((v) {
        onlineStores!.add(new OnlineStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['illustrationurl'] = this.illustrationurl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.onlineStores != null) {
      data['online_stores'] =
          this.onlineStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineStores {
  int? id;
  String? name;
  String? desc;
  String? afflink;
  int? percentcashback;
  String? logourl;
  String? createdAt;
  String? updatedAt;

  OnlineStores(
      {this.id,
      this.name,
      this.desc,
      this.afflink,
      this.percentcashback,
      this.logourl,
      this.createdAt,
      this.updatedAt});

  OnlineStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    afflink = json['afflink'];
    percentcashback = json['percentcashback'];
    logourl = json['logourl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
