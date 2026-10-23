

import 'category_model.dart';

class productModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;

  productModel(
      {this.id,
        this.title,
        this.slug,
        this.price,
        this.description,
        this.category,
        this.images,
       });

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }
}
