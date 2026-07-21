import 'package:store_app/core/error/exceptions/app_exception.dart';

class NetworkException  extends AppException   {
  final String message;

    NetworkException(this.message);
}