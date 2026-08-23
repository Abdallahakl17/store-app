 import 'package:store_app/features/auth/verify_code/data/models/verify_reset_code_request_model.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<String> verifyResetCode(
    VerifyResetCodeRequestModel request,
  );
}