import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/auth/forgot_password/domain/use_cases/forgot_password_use_case.dart';

 import 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordCubit(this.forgotPasswordUseCase)
      : super(ForgotPasswordInitial());

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());

    final result = await forgotPasswordUseCase(email);

    result.fold(
      (failure) {
        emit(
          ForgotPasswordFailure(failure.message),
        );
      },
      (message) {
        emit(
          ForgotPasswordSuccess(message),
        );
      },
    );
  }
}