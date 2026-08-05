import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF004182);
  static Color stroke = Color(0xFF003366).withValues(alpha: 0.6);

  static const Color textPrimary = Color(0xFF06004F);

  static Color textSecondary = Color(0xFF06004F).withValues(alpha: 0.6);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFD32F2F);
}
