import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'products.g.dart';

@JsonSerializable()
class Product {
  final String name;
  final String price;
  final String description;
  final List<String> images;
  final String createdAt;
  final double rating;
  final Category category;
  final String slug;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.rating,
    required this.category,
    required this.slug,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final mainImg = json['main_img'];

    List<String> additionalImages = [];
    for (int i = 1; i <= 5; i++) {
      if (json['img_$i'] != null) {
        final imgUrl = json['img_$i'];
        additionalImages.add(imgUrl);
      }
    }

    List<String> allImages = [mainImg, ...additionalImages];

    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      images: allImages,
      createdAt: json['created_at'],
      rating: json['rating'],
      category: Category.fromJson(json['category']),
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
