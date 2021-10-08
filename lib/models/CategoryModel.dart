class CategoryModel {
  String title;
  // String slug;
  String image;

  CategoryModel({
    this.title,
    // this.slug,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    title = json['name'];
    // slug = json['slug'];
    image = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.title;
    // data['slug'] = this.slug;
    data['image_url'] = this.image;
    return data;
  }
}
