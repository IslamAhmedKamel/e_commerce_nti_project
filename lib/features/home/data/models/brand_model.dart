class BrandModel {
  final String id;
  final String name;
  final String image;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}