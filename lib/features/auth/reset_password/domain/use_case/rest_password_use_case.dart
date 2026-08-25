import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/reset_password/domain/repositories/rest_password_repository.dart';
@lazySingleton

class ResetPasswordUseCase {
  final ResetPasswordRepository  resetPasswordRepository;

  ResetPasswordUseCase(this.resetPasswordRepository);
  Future<Either<Failure, String>> call(
       String email,
      String newPassword,
) {
  return resetPasswordRepository.resetPassword(email, newPassword);
}
}
