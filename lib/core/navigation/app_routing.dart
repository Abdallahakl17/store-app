import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/service_locator.dart';
import 'package:store_app/core/navigation/app_routes.dart';
import 'package:store_app/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:store_app/features/auth/forgot_password/presentation/screen/forgot_password_screen.dart';
import 'package:store_app/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:store_app/features/auth/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:store_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:store_app/features/auth/sign_up/presentation/screens/sing_up_screen.dart';
import 'package:store_app/features/auth/verify_code/presentation/cubit/verify_reset_code_cubit.dart';
import 'package:store_app/features/auth/verify_code/presentation/screen/verify_reset_code_screen.dart';
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
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (_) => getIt<SignInCubit>(),
                    child: const SignInScreen(),
                  ));
        case AppRoutes.forgetPasswordView:
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (_) => getIt<ForgotPasswordCubit>(),
                  child: ResetPasswordScreen()));
      case AppRoutes.verifyView:
  final email = routeSettings.arguments as String;

  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<VerifyResetCodeCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ForgotPasswordCubit>(),
        ),
      ],
      child: VerifyResetCodeScreen(
        email: email,
      ),
    ),
  );

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
