import 'package:store_app/features/wishlist/data/model/wishlist_model.dart';

abstract class WishlistRemoteDataSource {
  Future<List<WishlistModel>> getWishlist();

  Future<void> addToWishlist(String productId);

  Future<void> removeFromWishlist(String productId);
}