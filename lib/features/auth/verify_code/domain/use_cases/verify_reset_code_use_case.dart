import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/verify_code/domain/repositories/verify_reset_code_repository.dart';
 
@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepository repository;

  VerifyResetCodeUseCase(this.repository);

  Future<Either<Failure, String>> call(String resetCode) {
    return repository.verifyResetCode(resetCode);
  }
}