class AdsModel {
  int? id;
  String? title;
  String? contents;
  String? img;
  String? createdAt;
  String? updatedAt;

  AdsModel(
      {this.id,
      this.title,
      this.contents,
      this.img,
      this.createdAt,
      this.updatedAt});

  AdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contents = json['contents'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['contents'] = contents;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
