 
import 'package:store_app/features/home/domain/entity/Product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    super.priceAfterDiscount,
    required super.quantity,
    required super.sold,
    required super.imageCover,
    required super.images,
    required super.ratingsAverage,
    required super.ratingsQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      priceAfterDiscount:
          (json['priceAfterDiscount'] as num?)?.toDouble(),
      quantity: json['quantity'] as int? ?? 0,
      sold: json['sold'] as int? ?? 0,
      imageCover: json['imageCover'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      ratingsAverage:
          (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
      ratingsQuantity: json['ratingsQuantity'] as int? ?? 0,
    );
  }
}