import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/widgets/product_card.dart';
import 'package:store_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:store_app/features/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WishlistFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is WishlistSuccess) {
            if (state.wishlist.isEmpty) {
              return const Center(
                child: Text('Wishlist is empty'),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: state.wishlist.length,
              itemBuilder: (context, index) {
                final product = state.wishlist[index];

                return ProductCard(
                  image: product.imageCover,
                  name: product.title,
                  price: '${product.price} EGP',
                  oldPrice: '',
                  rating: product.ratingsAverage.toString(),
                  onFavorite: () {
                    context
                        .read<WishlistCubit>()
                        .toggleFavorite(product.id);
                  }, isFavorite:  context.watch<WishlistCubit>().isFavorite(product.id), 
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}