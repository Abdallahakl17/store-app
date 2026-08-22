import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/reset_password/domain/repositories/forgot_password_repository.dart';
@lazySingleton

class ForgotPasswordUseCase {
  ForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordUseCase(this.forgotPasswordRepository);

  Future<Either<Failure, String>> call(String email) {
    return forgotPasswordRepository.forgotPassword(email);
  }
}
