import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/core/error/dio_exception_mapper.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';
import 'package:store_app/core/error/failures/failures.dart';

import 'package:store_app/features/auth/reset_password/data/data_sources/forgot_password_remote_data_source.dart';
import 'package:store_app/features/auth/reset_password/domain/repositories/forgot_password_repository.dart';

@LazySingleton(as: ForgotPasswordRepository)
class ForgotPasswordRepositoryImpl
    implements ForgotPasswordRepository {

  final ForgotPasswordRemoteDataSource remoteDataSource;

  const ForgotPasswordRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, String>> forgotPassword(
    String email,
  ) async {
    try {
      final message = await remoteDataSource.forgotPassword(email);

      return Right(message);
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