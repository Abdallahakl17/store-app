import 'package:dartz/dartz.dart';

import 'package:store_app/core/error/failures/failures.dart';

abstract class VerifyResetCodeRepository {
  Future<Either<Failure, String>> verifyResetCode(String resetCode);
}