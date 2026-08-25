import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/auth/reset_password/data/data_sorce/reset_password_remote_data_source.dart';
import 'package:store_app/features/auth/reset_password/data/model/reset_password_model.dart';
 
@LazySingleton(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiService apiService;

  ResetPasswordRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> resetPassword(
    String email,
    String newPassword,
  ) async {
    final request = ResetPasswordModel(
  email: email,
  newPassword: newPassword,
);

    final response = await apiService.post(
      endPoint: ApiEndpoints.resetPassword,
      data: request.toJson(),
    );

    return response.data['token'] as String;
  }
}