import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/shared/user_entity.dart';
import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';

abstract class SignInRepository {
  Future<Either<Failure, UserEntity>> signIn(
     SignInRequestModel request,
  );
}