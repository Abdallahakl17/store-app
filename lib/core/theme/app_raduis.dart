import 'package:flutter/material.dart';

abstract class AppRadius {
  /// Base values
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;

  /// Circular Radius
  static const Radius rXs = Radius.circular(xs);
  static const Radius rSm = Radius.circular(sm);
  static const Radius rMd = Radius.circular(md);
  static const Radius rLg = Radius.circular(lg);

  /// BorderRadius (most used in UI)
  static const BorderRadius xsAll = BorderRadius.all(rXs);
  static const BorderRadius smAll = BorderRadius.all(rSm);
  static const BorderRadius mdAll = BorderRadius.all(rMd);
  static const BorderRadius lgAll = BorderRadius.all(rLg);

  /// Convenience shortcuts
  static const BorderRadius smTop = BorderRadius.only(
    topLeft: rSm,
    topRight: rSm,
  );

  static const BorderRadius mdTop = BorderRadius.only(
    topLeft: rMd,
    topRight: rMd,
  );

  static const BorderRadius lgTop = BorderRadius.only(
    topLeft: rLg,
    topRight: rLg,
  );
}