import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? priceAfterDiscount;
  final int quantity;
  final int sold;
  final String imageCover;
  final List<String> images;
  final double ratingsAverage;
  final int ratingsQuantity;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.priceAfterDiscount,
    required this.quantity,
    required this.sold,
    required this.imageCover,
    required this.images,
    required this.ratingsAverage,
    required this.ratingsQuantity,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        priceAfterDiscount,
        quantity,
        sold,
        imageCover,
        images,
        ratingsAverage,
        ratingsQuantity,
      ];
}