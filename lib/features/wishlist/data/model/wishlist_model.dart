import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';

class WishlistModel extends WishlistEntity {
  const WishlistModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imageCover,
    required super.ratingsAverage,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] ?? json['_id'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageCover: json['imageCover'] ?? '',
      ratingsAverage:
          (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
    );
  }
}