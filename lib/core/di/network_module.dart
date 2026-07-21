import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/auth_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  TalkerDioLogger logger() {
    return TalkerDioLogger(
      settings: TalkerDioLoggerSettings(
        enabled: kDebugMode,
        printRequestHeaders: true,
        printRequestData: true,
        printResponseHeaders: true,
        printResponseData: true,
        printResponseTime: true,
        errorPen: AnsiPen()..red(),
        requestPen: AnsiPen()..blue(),
        responsePen: AnsiPen()..green(),
      ),
    );
  }

  @lazySingleton
  Dio dio(
    AuthInterceptor authInterceptor,
    TalkerDioLogger logger,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(logger);
    dio.interceptors.add(authInterceptor);

    return dio;
  }
}
