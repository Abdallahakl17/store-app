import 'package:flutter/material.dart';

abstract class AppSpacing {
  /// Base unit = 4

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  /// ALL
  static const EdgeInsets xsAll = EdgeInsets.all(xs);
  static const EdgeInsets smAll = EdgeInsets.all(sm);
  static const EdgeInsets mdAll = EdgeInsets.all(md);
  static const EdgeInsets lgAll = EdgeInsets.all(lg);
  static const EdgeInsets xlAll = EdgeInsets.all(xl);
  static const EdgeInsets xxlAll = EdgeInsets.all(xxl);

  /// HORIZONTAL
  static const EdgeInsets smHorizontal =
      EdgeInsets.symmetric(horizontal: sm);

  static const EdgeInsets mdHorizontal =
      EdgeInsets.symmetric(horizontal: md);

  static const EdgeInsets lgHorizontal =
      EdgeInsets.symmetric(horizontal: lg);

  static const EdgeInsets xlHorizontal =
      EdgeInsets.symmetric(horizontal: xl);

  /// VERTICAL
  static const EdgeInsets smVertical =
      EdgeInsets.symmetric(vertical: sm);

  static const EdgeInsets mdVertical =
      EdgeInsets.symmetric(vertical: md);

  static const EdgeInsets lgVertical =
      EdgeInsets.symmetric(vertical: lg);

  static const EdgeInsets xlVertical =
      EdgeInsets.symmetric(vertical: xl);
}