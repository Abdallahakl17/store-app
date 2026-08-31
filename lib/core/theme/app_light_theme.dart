import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_raduis.dart';
import 'app_color_scheme.dart';
import 'app_text_styles.dart';

class AppLightTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: AppColorScheme.light,
        scaffoldBackgroundColor: AppColorScheme.light.primary,
        fontFamily: AppTextStyles.font14Regular.fontFamily,
        textTheme: TextTheme(
          headlineLarge: AppTextStyles.font24Bold.copyWith(
            color: AppColorScheme.light.onSurface,
          ),
          headlineSmall: AppTextStyles.font18medium
              .copyWith(color: AppColorScheme.light.onPrimary),
          titleLarge: AppTextStyles.font18Bold.copyWith(
            color: AppColorScheme.light.onSurface,
          ),
          titleMedium: AppTextStyles.font14SemiBold.copyWith(
            color: AppColorScheme.light.primary,
          ),
          bodyLarge: AppTextStyles.font14Regular.copyWith(
            color: AppColorScheme.light.onSurface,
          ),
          bodyMedium: AppTextStyles.font14Regular.copyWith(
            color: AppColorScheme.light.onSurface,
          ),
          bodySmall: AppTextStyles.font12Regular.copyWith(
            color: AppColorScheme.light.onSurface,
          ),
          labelSmall: AppTextStyles.font11Regular.copyWith(
              color: AppColorScheme.light.onSurfaceVariant,
              decorationColor: AppColorScheme.light.onSurfaceVariant),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorScheme.light.surface,
          foregroundColor: AppColorScheme.light.onSurface,
          centerTitle: true,
        ),
        dividerTheme: DividerThemeData(
          color: AppColorScheme.light.outline,
          thickness: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: AppTextStyles.font20SemiBold,
            backgroundColor: AppColorScheme.light.onPrimary,
            foregroundColor: AppColorScheme.light.primary,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.mdAll,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
          filled: true,
          fillColor: AppColorScheme.light.surface,
          hintStyle: AppTextStyles.font14Regular.copyWith(
            color: AppColorScheme.light.onSurfaceVariant,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide(
              color: AppColorScheme.light.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide(
              color: AppColorScheme.light.primary,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide(
              color: AppColorScheme.light.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide(
              color: AppColorScheme.light.error,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide(
              color: AppColorScheme.light.outline.withValues(alpha: 0.5),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColorScheme.light.primary,
        ),
      );
}
