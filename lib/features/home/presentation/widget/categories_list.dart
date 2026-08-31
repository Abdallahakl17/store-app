import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/theme/app_spacing.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppSpacing.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.tr.categories),
              TextButton(
                onPressed: () {},
                child: Text(context.tr.viewAll),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 300.h,
          child: GridView.builder(
            padding: EdgeInsetsDirectional.only(
              start: AppSpacing.lg,
            ),
            scrollDirection: Axis.horizontal,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.48,
            ),
            itemCount: 22,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      AppAssets.checkEmail,
                      width: 95.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  const Text(
                    'Category Name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}