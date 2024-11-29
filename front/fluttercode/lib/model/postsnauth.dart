class PostsNoAuth {
  int? id;
  String? title;
  bool? public;
  String? content;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? fname;

  PostsNoAuth(
      {this.id,
      this.title,
      this.public,
      this.content,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.fname});

  PostsNoAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    public = json['public'];
    content = json['content'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fname = json['profile']['fname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['public'] = this.public;
    data['content'] = this.content;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile']['fname'] = this.fname;

    return data;
  }
}
