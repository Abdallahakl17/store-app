import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/widgets/product_card.dart';
import 'package:store_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:store_app/features/home/presentation/cubit/product_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ProductSuccess) {
            return GridView.builder(
              controller: context.read<ProductCubit>().scrollController,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];

                return ProductCard(
                  image: product.imageCover,
                  name: product.title,
                  price: product.priceAfterDiscount != null
                      ? '${product.priceAfterDiscount} EGP'
                      : '${product.price} EGP',
                  oldPrice: product.priceAfterDiscount != null
                      ? '${product.price} EGP'
                      : '',
                  rating: product.ratingsAverage.toString(), isFavorite:  true,
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
