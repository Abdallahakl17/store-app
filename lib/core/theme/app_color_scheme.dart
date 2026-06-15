import 'package:flutter/material.dart';
import 'package:store_app/core/theme/app_color.dart';

class AppColorScheme {
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.primary,
    onSecondary: AppColors.white,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.white,
    onSurface: AppColors.textPrimary,
  );
}