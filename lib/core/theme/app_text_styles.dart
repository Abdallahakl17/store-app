import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

abstract class AppTextStyles {
  static TextStyle font24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    height: 18 / 24,
  );

  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    height: 18 / 20,
  );

  static TextStyle font18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    height: 1,
  );

  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    height: 18 / 14,
  );

  static TextStyle font14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    height: 18 / 14,
  );

  static TextStyle font12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    height: 18 / 12,
  );

  static TextStyle font11Regular = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    height: 18 / 11,
  );
}