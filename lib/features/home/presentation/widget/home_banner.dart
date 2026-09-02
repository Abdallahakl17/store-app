import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/theme/app_raduis.dart';
import 'package:store_app/core/theme/app_spacing.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      AppAssets.banner1,
      AppAssets.banner2,
      AppAssets.banner3,
    ];

    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              AppRadius.md,
            ),
            child: Image.asset(
              banners[index],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
