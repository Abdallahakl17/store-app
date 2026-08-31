import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/widgets/form.dart';
import 'package:store_app/core/widgets/product_card.dart';
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

              // Categories
              const CategoriesList(),

              // Products title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  context.tr.homeAppliance,
                  style: context.textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: 12),

              // Products
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    ProductCard(
                      image: AppAssets.banner1,
                      name: 'Product Name',
                      price: 'EGP 1,000',
                      oldPrice: '1,300 EGP',
                      rating: '4.8',
                      onFavorite: () {},
                      onAdd: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
