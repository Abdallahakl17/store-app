import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/dio_exception_mapper.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:store_app/features/wishlist/domain/repositories/wishlist_repository.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource remoteDataSource;

  const WishlistRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<WishlistEntity>>> getWishlist() async {
    try {
      final wishlist = await remoteDataSource.getWishlist();

      return Right(wishlist);
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

  @override
  Future<Either<Failure, void>> addToWishlist(
    String productId,
  ) async {
    try {
      await remoteDataSource.addToWishlist(productId);

      return const Right(null);
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

  @override
  Future<Either<Failure, void>> removeFromWishlist(
    String productId,
  ) async {
    try {
      await remoteDataSource.removeFromWishlist(productId);

      return const Right(null);
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