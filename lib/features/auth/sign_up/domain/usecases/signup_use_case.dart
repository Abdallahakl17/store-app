import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/sign_up/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/sign_up/domain/repositories/sign_up_repository.dart';

@injectable
class SignupUseCase {
  final SignUpRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(SignupRequestModel request) {
    return repository.signUp(request);
  }
}
