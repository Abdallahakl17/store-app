import 'package:dio/dio.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/exceptions/business_exception.dart';
import 'package:store_app/core/error/exceptions/network_exception.dart';
import 'package:store_app/core/error/exceptions/server_exception.dart';
import 'package:store_app/core/error/exceptions/unauthorized_exception.dart';
import 'package:store_app/core/error/exceptions/validation_exception.dart';
import 'package:store_app/core/error/models/api_error_response_model.dart';
import 'package:store_app/core/error/status_code.dart';

class DioExceptionMapper {
  static AppException map(DioException exception) {
    final statusCode = exception.response?.statusCode;

    final data = exception.response?.data;

    ApiErrorResponseModel? errorResponse;

    if (data is Map<String, dynamic>) {
      errorResponse = ApiErrorResponseModel.fromJson(data);
    }

    final message = errorResponse?.message ?? 'Something went wrong';

    if (statusCode == StatusCode.unauthorized) {
      return UnauthorizedException(message);
    }

    if (statusCode == StatusCode.unprocessableEntity) {
      return ValidationException(
        field: errorResponse?.errors?.param ?? '',
        message: message,
      );
    }

    if (statusCode == StatusCode.badRequest || statusCode == 409) {
      return BusinessException(message);
    }

    if (statusCode != null && statusCode >= 500) {
      return ServerException(message);
    }

    if (exception.type == DioExceptionType.connectionError ||
        exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.sendTimeout) {
      return NetworkException('Check your internet connection');
    }

    return ServerException(message);
  }
}
