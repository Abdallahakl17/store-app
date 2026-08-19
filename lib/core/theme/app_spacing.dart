import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSpacing {
  static double get xs => 4.w;
  static double get sm => 8.w;
  static double get md => 12.w;
  static double get lg => 16.w;
  static double get xl => 24.w;
  static double get xxl => 32.w;

  // ALL
  static EdgeInsets get xsAll => EdgeInsets.all(xs);
  static EdgeInsets get smAll => EdgeInsets.all(sm);
  static EdgeInsets get mdAll => EdgeInsets.all(md);
  static EdgeInsets get lgAll => EdgeInsets.all(lg);
  static EdgeInsets get xlAll => EdgeInsets.all(xl);
  static EdgeInsets get xxlAll => EdgeInsets.all(xxl);

  // HORIZONTAL
  static EdgeInsets get xsHorizontal =>
      EdgeInsets.symmetric(horizontal: xs);

  static EdgeInsets get smHorizontal =>
      EdgeInsets.symmetric(horizontal: sm);

  static EdgeInsets get mdHorizontal =>
      EdgeInsets.symmetric(horizontal: md);

  static EdgeInsets get lgHorizontal =>
      EdgeInsets.symmetric(horizontal: lg);

  static EdgeInsets get xlHorizontal =>
      EdgeInsets.symmetric(horizontal: xl);

  static EdgeInsets get xxlHorizontal =>
      EdgeInsets.symmetric(horizontal: xxl);

  // VERTICAL
  static EdgeInsets get xsVertical =>
      EdgeInsets.symmetric(vertical: xs);

  static EdgeInsets get smVertical =>
      EdgeInsets.symmetric(vertical: sm);

  static EdgeInsets get mdVertical =>
      EdgeInsets.symmetric(vertical: md);

  static EdgeInsets get lgVertical =>
      EdgeInsets.symmetric(vertical: lg);

  static EdgeInsets get xlVertical =>
      EdgeInsets.symmetric(vertical: xl);

  static EdgeInsets get xxlVertical =>
      EdgeInsets.symmetric(vertical: xxl);
}