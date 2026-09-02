import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/home/domain/entity/Product_entity.dart';
 import 'package:store_app/features/home/domain/repositories/product_repository.dart';

@lazySingleton
class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> call(int page) {
  return productRepository.getProducts(page);
}
}