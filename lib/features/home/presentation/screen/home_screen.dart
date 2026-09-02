import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
 import 'package:store_app/core/widgets/form.dart';
import 'package:store_app/core/widgets/product_card.dart';
import 'package:store_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:store_app/features/home/presentation/cubit/categories_state.dart';
import 'package:store_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:store_app/features/home/presentation/cubit/product_state.dart';
import 'package:store_app/features/home/presentation/widget/categories_list.dart';
import 'package:store_app/features/home/presentation/widget/home_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,

        // ================= APP BAR =================
        appBar: AppBar(
          toolbarHeight: 80.h,
          title: CustomTextField(
            hintText: context.tr.whatDoYouSearch,
            prefixIcon: SvgPicture.asset(
              AppAssets.searchIcon,
            ),
          ),
          actions: [
            IconButton(
              color: context.colorScheme.primary,
              iconSize: 24,
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.shoppingIcon,
              ),
            ),
          ],
        ),

        // ================= BODY =================
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              const HomeBanner(),

              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is CategoriesFailure) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is CategoriesSuccess) {
                    return CategoriesList(
                      categories: state.categories,
                    );
                  }

                  return const SizedBox();
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  context.tr.homeAppliance,
                  style: context.textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: 12),

              // Products
              BlocBuilder<ProductCubit, ProductState>(
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
                    final products = state.products.take(8).toList();

                    return SizedBox(
                      height: 250.h,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return ProductCard(
                            image: product.imageCover,
                            name: product.title,
                            price: 'EGP ${product.price}',
                            oldPrice: product.priceAfterDiscount != null
                                ? '${product.priceAfterDiscount} EGP'
                                : '',
                            rating: product.ratingsAverage.toString(),
                            onFavorite: () {},
                            onAdd: () {},
                            isFavorite: true,
                          );
                        },
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
