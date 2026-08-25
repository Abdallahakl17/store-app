import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, String>> resetPassword(
      String email, String newPassword);
}
