import 'package:flutter/material.dart';
 import 'package:store_app/core/navigation/app_routes.dart';
import 'package:store_app/core/navigation/app_routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRouter.onGenerateRoute,

      initialRoute: AppRoutes.initialRoute,
    );
  }
}