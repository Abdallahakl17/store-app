 import 'package:store_app/core/error/failures/failures.dart';

class ValidationFailure extends Failure {
  final String field;

  const ValidationFailure({
    required this.field,
    required String message,
  }) : super(message);
}