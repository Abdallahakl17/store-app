import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/shared/auth_response_model.dart';
@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl
    implements SignUpRemoteDataSource {

  final ApiService apiService;

  const SignUpRemoteDataSourceImpl(this.apiService);

  @override
  Future<AuthResponseModel> signUp(
    SignupRequestModel request,
  ) async {
    final response = await apiService.post(
      endPoint: ApiEndpoints.signup,
      data: request.toJson(),
    );

    return AuthResponseModel.fromJson(response.data);
  }
}
