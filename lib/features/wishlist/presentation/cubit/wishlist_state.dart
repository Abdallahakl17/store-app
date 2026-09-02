import 'package:equatable/equatable.dart';

import 'package:store_app/features/wishlist/domain/entity/wishlist_entity.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState {
  final List<WishlistEntity> wishlist;

  const WishlistSuccess(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

class WishlistFailure extends WishlistState {
  final String message;

  const WishlistFailure(this.message);

  @override
  List<Object?> get props => [message];
}