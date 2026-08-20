import 'package:store_app/features/auth/shared/user_entity.dart';

sealed class SignupState {
  const SignupState();
}

final class SignupInitial extends SignupState {
  const SignupInitial();
}

final class SignupLoading extends SignupState {
  const SignupLoading();
}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  const SignupSuccess(this.user);
}

final class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);
}
