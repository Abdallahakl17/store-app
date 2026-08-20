import 'package:store_app/features/auth/shared/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name, required super.email, required super.role});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        role: json['role'] as String);
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'role': role,
  //   };
  // }
}
