import 'package:flutter/material.dart';

extension SpacingX on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
extension RadiusX on num {
  BorderRadius get br => BorderRadius.circular(toDouble());
}