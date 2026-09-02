import 'package:dartz/dartz.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<WishlistEntity>>> getWishlist();

  Future<Either<Failure, void>> addToWishlist(String productId);

  Future<Either<Failure, void>> removeFromWishlist(String productId);
}