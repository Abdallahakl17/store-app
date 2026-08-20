import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/shared/user_entity.dart';

abstract class SignUpRepository {
  Future<Either<Failure, UserEntity>> signUp(
    SignupRequestModel request,
  );
}