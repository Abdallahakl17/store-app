import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/shared/auth_response_model.dart';

abstract class SignUpRemoteDataSource {
  Future<AuthResponseModel> signUp(
    SignupRequestModel request,
  );
}