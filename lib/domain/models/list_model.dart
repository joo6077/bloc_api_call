class ListModel {
  int? id;
  String? title;
  String? contents;
  int? categoryId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  ListModel(
      {this.id,
      this.title,
      this.contents,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  ListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contents = json['contents'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['contents'] = contents;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
