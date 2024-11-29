class LocalStores {
  int? id;
  String? name;
  String? rules;
  String? localization;
  String? phone;
  String? urllogo;
  String? code;
  int? cep;
  String? benefit;
  Null? verifiqued;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  List<VerifiquedBuyLocalStores>? verifiquedBuyLocalStores;

  LocalStores(
      {this.id,
      this.name,
      this.rules,
      this.localization,
      this.phone,
      this.urllogo,
      this.code,
      this.cep,
      this.benefit,
      this.verifiqued,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.verifiquedBuyLocalStores});

  LocalStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rules = json['rules'];
    localization = json['localization'];
    phone = json['phone'];
    urllogo = json['urllogo'];
    code = json['code'];
    cep = json['cep'];
    benefit = json['benefit'];
    verifiqued = json['verifiqued'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['verifiqued_buy_local_stores'] != null) {
      verifiquedBuyLocalStores = <VerifiquedBuyLocalStores>[];
      json['verifiqued_buy_local_stores'].forEach((v) {
        verifiquedBuyLocalStores!.add(new VerifiquedBuyLocalStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rules'] = this.rules;
    data['localization'] = this.localization;
    data['phone'] = this.phone;
    data['urllogo'] = this.urllogo;
    data['code'] = this.code;
    data['cep'] = this.cep;
    data['benefit'] = this.benefit;
    data['verifiqued'] = this.verifiqued;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.verifiquedBuyLocalStores != null) {
      data['verifiqued_buy_local_stores'] =
          this.verifiquedBuyLocalStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VerifiquedBuyLocalStores {
  int? id;
  int? profile;
  int? localStore;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  VerifiquedBuyLocalStores(
      {this.id,
      this.profile,
      this.localStore,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
});

  VerifiquedBuyLocalStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    localStore = json['local_store'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['local_store'] = this.localStore;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class Formats {
  Thumbnail? thumbnail;
  Thumbnail? small;
  Thumbnail? large;
  Thumbnail? medium;

  Formats({this.thumbnail, this.small, this.large, this.medium});

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    small =
        json['small'] != null ? new Thumbnail.fromJson(json['small']) : null;
    large =
        json['large'] != null ? new Thumbnail.fromJson(json['large']) : null;
    medium =
        json['medium'] != null ? new Thumbnail.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  Null? path;
  String? url;

  Thumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.width,
      this.height,
      this.size,
      this.path,
      this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}
