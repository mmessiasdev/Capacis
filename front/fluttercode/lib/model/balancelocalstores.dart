class BalanceLocalStores {
  int? id;
  String? value;
  bool? approved;
  String? publishedAt;
  String? storeName;
  String? createdAt;
  String? updatedAt;

  BalanceLocalStores({
    this.id,
    this.value,
    this.storeName,
    this.approved,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  BalanceLocalStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    storeName = json['local_store']['name'];
    approved = json['approved'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['approved'] = this.approved;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
