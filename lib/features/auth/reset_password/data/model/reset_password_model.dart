class ResetPasswordModel {
  final String email;
  final String newPassword;

  const ResetPasswordModel({
    required this.email,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'newPassword': newPassword,
    };
  }
}