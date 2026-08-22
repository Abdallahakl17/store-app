import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, String>> forgotPassword(String email);
}