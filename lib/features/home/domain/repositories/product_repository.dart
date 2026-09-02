import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';
 import 'package:store_app/features/home/domain/entity/product_entity.dart';

abstract class ProductRepository  {
  Future<Either<Failure, List<ProductEntity>>> getProducts(int page);
}