 import 'package:injectable/injectable.dart';

import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/auth/verify_code/data/data_sources/verify_reset_code_remote_data_source.dart';
  import 'package:store_app/features/auth/verify_code/data/models/verify_reset_code_request_model.dart';

@LazySingleton(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl
    implements VerifyResetCodeRemoteDataSource {
  final ApiService apiService;

  VerifyResetCodeRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> verifyResetCode(
    VerifyResetCodeRequestModel request,
  ) async {
    final response = await apiService.post(
      endPoint: ApiEndpoints.verifyResetCode,
      data: request.toJson(),
    );

  return response.data['status'] as String;
  }
}