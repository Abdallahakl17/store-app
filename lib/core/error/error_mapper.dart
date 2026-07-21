import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/exceptions/business_exception.dart';
import 'package:store_app/core/error/exceptions/network_exception.dart';
import 'package:store_app/core/error/exceptions/server_exception.dart';
import 'package:store_app/core/error/exceptions/unauthorized_exception.dart';
import 'package:store_app/core/error/exceptions/validation_exception.dart';
import 'package:store_app/core/error/failures/business_failure.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/core/error/failures/network_failure.dart';
import 'package:store_app/core/error/failures/server_failure.dart';
import 'package:store_app/core/error/failures/unauthorized_failure.dart';
import 'package:store_app/core/error/failures/validation_failure.dart';

class ErrorMapper {
  static Failure map(AppException exception) {
    if (exception is ValidationException) {
      return ValidationFailure(
        field: exception.field,
        message: exception.message,
      );
    }

    if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    }

    if (exception is BusinessException) {
      return BusinessFailure(exception.message);
    }

    if (exception is UnauthorizedException) {
      return UnauthorizedFailure(exception.message);
    }

    if (exception is ServerException) {
      return ServerFailure(exception.message);
    }

    return const ServerFailure('Unknown Error');
  }
}
