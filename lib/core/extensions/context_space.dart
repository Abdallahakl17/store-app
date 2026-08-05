import 'package:flutter/material.dart';

 
extension RadiusX on num {
  BorderRadius get br => BorderRadius.circular(toDouble());
}