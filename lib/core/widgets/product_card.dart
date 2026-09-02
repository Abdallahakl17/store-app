import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/theme/app_raduis.dart';
import 'package:store_app/core/theme/app_spacing.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.rating,
    this.onFavorite,
    this.onAdd,
      required this.isFavorite,
  });

  final String image;
  final String name;
  final String price;
  final String oldPrice;
  final String rating;
  final VoidCallback? onFavorite;
  final VoidCallback? onAdd;
final bool  isFavorite;
  @override
  Widget build(BuildContext context) {
   return Container(
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: AppRadius.lgAll,
    border: Border.all(
      width: 2,
      color: context.colorScheme.surfaceContainer,
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: AppRadius.mdTop,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 128.h,
            ),
          ),
          Positioned(
            top: 0,
            right: -5.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onFavorite,
            icon: SvgPicture.asset(
  isFavorite
      ? AppAssets.  fivoriteFilledIcon
      : AppAssets.favoriteIcon,
),
            ),
          ),
        ],
      ),

      Padding(
        padding: AppSpacing.smAll,
        child: Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      Padding(
        padding: AppSpacing.smHorizontal,
        child: Row(
          children: [
            Text(price),
            SizedBox(width: AppSpacing.sm),
            if (oldPrice.isNotEmpty)
              Text(
                oldPrice,
                style: context.textTheme.labelSmall,
              ),
          ],
        ),
      ),

      const Spacer(),

      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          children: [
            const Text('Review'),
            Padding(
              padding: AppSpacing.smAll,
              child: Text('($rating)'),
            ),
            SvgPicture.asset(
              AppAssets.starIcon,
            ),
            const Spacer(),
            GestureDetector(
              onTap: onAdd,
              child: SvgPicture.asset(
                AppAssets.plusFilledIcon,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}
