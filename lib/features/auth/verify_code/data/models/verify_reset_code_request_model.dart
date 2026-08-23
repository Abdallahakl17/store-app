class VerifyResetCodeRequestModel {
  final String resetCode;

  const VerifyResetCodeRequestModel({
    required this.resetCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'resetCode': resetCode,
    };
  }
}