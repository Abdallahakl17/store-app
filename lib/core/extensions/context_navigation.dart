import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  bool get canPop => Navigator.canPop(this);

  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<bool> maybePop<T extends Object?>([T? result]) {
    return Navigator.maybePop(this, result);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }
}
