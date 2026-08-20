import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/auth/shared/auth_response_model.dart';
import 'package:store_app/features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';

@Injectable(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final ApiService apiService;

  SignInRemoteDataSourceImpl(this.apiService);

  @override
  Future<AuthResponseModel> signIn(
    SignInRequestModel request,
  ) async {
    final response = await apiService.post(
           
 endPoint:  ApiEndpoints.signin, 
      data: request.toJson(), 
    );

    return AuthResponseModel.fromJson(response.data);
  }
}