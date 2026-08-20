import 'package:store_app/features/auth/shared/user_model.dart';

class AuthResponseModel {
  final String message;
  final String token;
  final UserModel user;

    AuthResponseModel(
      {required this.message, required this.token, required this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'] as String,
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
