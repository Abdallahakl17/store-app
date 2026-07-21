import 'package:store_app/core/error/exceptions/app_exception.dart';

class ServerException extends AppException{
  final String message;

    ServerException(this.message);
}