import 'package:store_app/features/auth/sign_up/data/models/user_model.dart';

class SignupResponseModel {
  final String message;
  final String token;
  final UserModel user;

  const SignupResponseModel(
      {required this.message, required this.token, required this.user});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'] as String,
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
