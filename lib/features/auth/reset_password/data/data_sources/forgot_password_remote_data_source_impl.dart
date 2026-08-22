import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/auth/reset_password/data/data_sources/forgot_password_remote_data_source.dart';

@LazySingleton(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImpl
    implements ForgotPasswordRemoteDataSource {
  final ApiService apiService;

  const ForgotPasswordRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> forgotPassword(String email) async {
    final response = await apiService.post(
      endPoint: ApiEndpoints.forgotPassword,
      data: {
        'email': email,
      },
    );

    return response.data['message'] as String;
  }
}
