
class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  // من JSON لـ Object
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // من Object لـ JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}