import 'package:store_app/features/auth/shared/auth_response_model.dart';
import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';

abstract class SignInRemoteDataSource {
  Future<AuthResponseModel> signIn(
    SignInRequestModel request,
  );
}