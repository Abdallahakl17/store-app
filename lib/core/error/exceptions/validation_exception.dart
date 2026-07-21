import 'package:store_app/core/error/exceptions/app_exception.dart';

class ValidationException  extends AppException   {
  final String field;
  final String message;

    ValidationException({
    required this.field,
    required this.message,
  });
}