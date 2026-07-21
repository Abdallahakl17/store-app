import 'package:store_app/core/error/exceptions/app_exception.dart';

class UnauthorizedException   extends AppException {
  final String message;

    UnauthorizedException(this.message);
}