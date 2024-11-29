class ChunksAttributes {
  String? title;
  String? createdAt;
  String? updatedAt;
  String? subtitle;

  ChunksAttributes({this.title, this.createdAt, this.updatedAt, this.subtitle});

  ChunksAttributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
