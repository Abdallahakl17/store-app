import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/core/navigation/app_routes.dart';
import 'package:store_app/splash.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final name = routeSettings.name;
    try {
      switch (name) {
        case AppRoutes.initialRoute:
          return MaterialPageRoute(builder: (_) => SplashScreen());
        default:
          _errorRoute();
      }
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return _errorRoute(text: e.toString());
    }
  }

  static Route<dynamic> _errorRoute({String text = 'Route not found'}) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(text, style: TextStyle(color: Colors.red)),
        ),
      ),
    );
  }
}
