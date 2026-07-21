import 'package:store_app/core/error/exceptions/app_exception.dart';

class BusinessException  extends AppException   {
  final String message;

    BusinessException(this.message);
}