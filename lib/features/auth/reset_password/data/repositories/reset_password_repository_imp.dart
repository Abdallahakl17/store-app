import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/dio_exception_mapper.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/core/services/token_storage_service.dart';
import 'package:store_app/features/auth/reset_password/data/data_sorce/reset_password_remote_data_source.dart';
import 'package:store_app/features/auth/reset_password/domain/repositories/rest_password_repository.dart';

@LazySingleton(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource remoteDataSource;
  final TokenStorageService tokenStorage;

  const ResetPasswordRepositoryImpl(
    this.remoteDataSource,
    this.tokenStorage,
  );

  @override
  Future<Either<Failure, String>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final token = await remoteDataSource.resetPassword(
               email,
        newPassword,
      );

      await tokenStorage.saveToken(token);

      return Right(token);
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
