import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/core/services/token_storage_service.dart';
import 'package:store_app/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/sign_up/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/sign_up/domain/repositories/sign_up_repository.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;
  final TokenStorageService tokenStorage;

  const SignUpRepositoryImpl(
    this.remoteDataSource,
    this.tokenStorage,
  );

  @override
  Future<Either<Failure, UserEntity>> signUp(
    SignupRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.signUp(request);

      await tokenStorage.saveToken(response.token);

      return Right(response.user);
    } on AppException catch (e) {
      return Left(ErrorMapper.map(e));
    }
  }
}