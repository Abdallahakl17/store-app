import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/dio_exception_mapper.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';

import 'package:store_app/features/home/data/data_source/product_remote_data_source.dart';
import 'package:store_app/features/home/domain/entity/product_entity.dart';
import 'package:store_app/features/home/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  const ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();

      return Right(products);
    } on AppException catch (e) {
      return Left(ErrorMapper.map(e));
    } on DioException catch (e) {
      return Left(
        ErrorMapper.map(
          DioExceptionMapper.map(e),
        ),
      );
    }
  }
}