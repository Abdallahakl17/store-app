import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:store_app/features/wishlist/domain/repositories/wishlist_repository.dart';

@lazySingleton
class GetWishlistUseCase {
  final WishlistRepository wishlistRepository;

  GetWishlistUseCase(this.wishlistRepository);

  Future<Either<Failure, List<WishlistEntity>>> call() {
    return wishlistRepository.getWishlist();
  }
}