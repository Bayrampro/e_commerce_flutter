// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String,
      rating: (json['rating'] as num).toDouble(),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'createdAt': instance.createdAt,
      'rating': instance.rating,
      'category': instance.category,
      'slug': instance.slug,
    };
