import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/dio_exception_mapper.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/core/services/token_storage_service.dart';

import 'package:store_app/features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';
import 'package:store_app/features/auth/sign_in/domain/repository/sign_in_repository.dart';

import 'package:store_app/features/auth/shared/user_entity.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource remoteDataSource;
  final TokenStorageService tokenStorage;

  const SignInRepositoryImpl(
    this.remoteDataSource,
    this.tokenStorage,
  );

  @override
  Future<Either<Failure, UserEntity>> signIn(
    SignInRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.signIn(request);

      await tokenStorage.saveToken(response.token);

      return Right(response.user);
    } on AppException catch (e) {
      return Left(ErrorMapper.map(e));
    } on DioException catch (e) {
      return Left(
        ErrorMapper.map(
          DioExceptionMapper.map(e),
        ),
      );
    }
  }
}