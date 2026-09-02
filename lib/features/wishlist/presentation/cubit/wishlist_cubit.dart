import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:store_app/features/wishlist/domain/use_case/add_to_wishlist_usecase.dart';
import 'package:store_app/features/wishlist/domain/use_case/get_wishlist_usecase.dart';
import 'package:store_app/features/wishlist/domain/use_case/remove_from_wishlist_usecase.dart';

import 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistUseCase getWishlistUseCase;
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistCubit(
    this.getWishlistUseCase,
    this.addToWishlistUseCase,
    this.removeFromWishlistUseCase,
  ) : super(WishlistInitial());

  List<WishlistEntity> wishlist = [];

  Set<String> get favoriteProductIds {
    return wishlist.map((product) => product.id).toSet();
  }

  Future<void> getWishlist() async {
    emit(WishlistLoading());

    final result = await getWishlistUseCase();

    result.fold(
      (failure) {
        emit(WishlistFailure(failure.message));
      },
      (products) {
        wishlist = products;

        emit(WishlistSuccess(List.from(wishlist)));
      },
    );
  }

  bool isFavorite(String productId) {
    return wishlist.any(
      (product) => product.id == productId,
    );
  }

  Future<void> toggleFavorite(String productId) async {
    if (isFavorite(productId)) {
      await removeFromWishlist(productId);
    } else {
      await addToWishlist(productId);
    }
  }

  Future<void> addToWishlist(String productId) async {
    final result = await addToWishlistUseCase(productId);

    result.fold(
      (failure) {
        emit(WishlistFailure(failure.message));
      },
      (_) {
        // هنحدّث الحالة من خلال getWishlist
        getWishlist();
      },
    );
  }

  Future<void> removeFromWishlist(String productId) async {
    final result = await removeFromWishlistUseCase(productId);

    result.fold(
      (failure) {
        emit(WishlistFailure(failure.message));
      },
      (_) {
        wishlist.removeWhere(
          (product) => product.id == productId,
        );

        emit(WishlistSuccess(List.from(wishlist)));
      },
    );
  }
}