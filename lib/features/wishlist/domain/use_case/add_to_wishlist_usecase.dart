import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/wishlist/domain/repositories/wishlist_repository.dart';

@lazySingleton
class AddToWishlistUseCase {
  final WishlistRepository wishlistRepository;

  AddToWishlistUseCase(this.wishlistRepository);

  Future<Either<Failure, void>> call(String productId) {
    return wishlistRepository.addToWishlist(productId);
  }
}