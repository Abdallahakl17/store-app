import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/shared/user_entity.dart';
import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';
import 'package:store_app/features/auth/sign_in/domain/repository/sign_in_repository.dart';

@injectable
class SignInUseCase {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(SignInRequestModel request) {
    return repository.signIn(request);
  }
}
