import 'package:e_commerce/features/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final String name;
  final List<Product> products;
  final String slug;

  Category({
    required this.name,
    required this.products,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List?;
    List<Product> productList =
        list != null ? list.map((i) => Product.fromJson(i)).toList() : [];

    return Category(
      name: json['name'],
      products: productList,
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
