import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/service_locator.dart';
import 'package:store_app/core/navigation/app_routes.dart';
import 'package:store_app/features/auth/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:store_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:store_app/features/auth/sign_up/presentation/screens/sing_up_screen.dart';
import 'package:store_app/splash.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final name = routeSettings.name;
    try {
      switch (name) {
        case AppRoutes.initialRoute:
          return MaterialPageRoute(builder: (_) => SplashScreen());
        case AppRoutes.registerView:
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BlocProvider(
              create: (_) => getIt<SignupCubit>(),
              child: const SignUpScreen(),
            ),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        case AppRoutes.loginView:
          return MaterialPageRoute(builder: (_) => SignInScreen());
        default:
          _errorRoute();
      }
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return _errorRoute(text: e.toString());
    }
    return _errorRoute(text: 'Route not found');
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
