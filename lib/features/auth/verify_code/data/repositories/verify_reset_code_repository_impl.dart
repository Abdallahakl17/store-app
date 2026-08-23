import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/error_mapper.dart';
import 'package:store_app/core/error/exceptions/app_exception.dart';

import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/verify_code/data/data_sources/verify_reset_code_remote_data_source.dart';
import 'package:store_app/features/auth/verify_code/data/models/verify_reset_code_request_model.dart';
import 'package:store_app/features/auth/verify_code/domain/repositories/verify_reset_code_repository.dart';

@LazySingleton(as: VerifyResetCodeRepository)
class VerifyResetCodeRepositoryImpl implements VerifyResetCodeRepository {
  final VerifyResetCodeRemoteDataSource remoteDataSource;

  VerifyResetCodeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> verifyResetCode(
    String resetCode,
  ) async {
    try {
      final request = VerifyResetCodeRequestModel(
        resetCode: resetCode,
      );

      final result = await remoteDataSource.verifyResetCode(request);

      return Right(result);
    } on AppException catch (e) {
      return Left(ErrorMapper.map(e));
    }
  }
}
