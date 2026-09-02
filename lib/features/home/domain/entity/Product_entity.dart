import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final double price;
  final String imageCover;
  final double ratingsAverage;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        imageCover,
        ratingsAverage,
      ];
}