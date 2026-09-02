import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/extensions/context_config.dart';

import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/features/home/domain/entity/category_entity.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

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
              Text(
                context.tr.categories,
                style: context.textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.tr.viewAll,
                ),
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      category.image,
                      width: 95.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: AppSpacing.sm,
                  ),
                  Text(
                    category.name,
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
