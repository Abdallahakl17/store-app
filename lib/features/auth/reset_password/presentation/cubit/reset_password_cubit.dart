import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/auth/reset_password/domain/use_case/rest_password_use_case.dart';

 import 'package:store_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit(
    this.resetPasswordUseCase,
  ) : super(const ResetPasswordInitial());

  Future<void> resetPassword(  {
    required String email,
    required String newPassword,
  }) async {
    emit(const ResetPasswordLoading());

    final result = await resetPasswordUseCase(
      email,
      newPassword,
    );

    result.fold(
      (failure) {
        emit(
          ResetPasswordFailure(
            message: failure.message,
          ),
        );
      },
      (_) {
        emit(
          const ResetPasswordSuccess(),
        );
      },
    );
  }
}