
import 'package:e_commerce_nti_project/features/home/data/models/catygroy_model.dart';

class ProductModel {
  bool isFavorite = false;
  final int sold;
  final List<String> images;
  final List<Subcategory> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final CategoryModel category;
  final Brand brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      subcategory: (json['subcategory'] as List?)
          ?.map((e) => Subcategory.fromJson(e))
          .toList() ?? [],
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      imageCover: json['imageCover'] ?? '',
      category: CategoryModel.fromJson(json['category'] ?? {}),
      brand: Brand.fromJson(json['brand'] ?? {}),
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sold': sold,
      'images': images,
      'subcategory': subcategory.map((e) => e.toJson()).toList(),
      'ratingsQuantity': ratingsQuantity,
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'quantity': quantity,
      'price': price,
      'imageCover': imageCover,
      'category': category.toJson(),
      'brand': brand.toJson(),
      'ratingsAverage': ratingsAverage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
// models/brand_model.dart

class Brand {
  final String id;
  final String name;
  final String slug;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}// models/subcategory_model.dart

class Subcategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': category,
    };
  }
}