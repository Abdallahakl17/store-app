import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/domain/entity/product_entity.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;

  const ProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductPaginationLoading extends ProductState {
  final List<ProductEntity> products;

  const ProductPaginationLoading(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductFailure extends ProductState {
  final String message;

  const ProductFailure(this.message);

  @override
  List<Object?> get props => [message];
}