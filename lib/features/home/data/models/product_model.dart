import '../../domain/entities/product_entity.dart';
import 'category_model.dart';

class ProductModel {
  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final String? description;
  final CategoryModel? category;
  final List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      price: price,
      description: description,
      category: category?.toEntity(),
      images: images,
    );
  }
}
