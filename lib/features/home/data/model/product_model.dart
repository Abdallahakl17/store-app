import 'package:store_app/features/home/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imageCover,
    required super.ratingsAverage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      imageCover: json['imageCover'],
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}