sealed class VerifyResetCodeState {}

class VerifyResetCodeInitial extends VerifyResetCodeState {}

class VerifyResetCodeLoading extends VerifyResetCodeState {}

class VerifyResetCodeSuccess extends VerifyResetCodeState {
  final String message;

  VerifyResetCodeSuccess(this.message);
}

class VerifyResetCodeFailure extends VerifyResetCodeState {
  final String message;

  VerifyResetCodeFailure(this.message);
}