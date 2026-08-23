import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/auth/verify_code/domain/use_cases/verify_reset_code_use_case.dart';

import 'verify_reset_code_state.dart';

@injectable
class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  final VerifyResetCodeUseCase verifyResetCodeUseCase;

  VerifyResetCodeCubit(this.verifyResetCodeUseCase)
      : super(VerifyResetCodeInitial());

  Future<void> verifyResetCode(String resetCode) async {
    emit(VerifyResetCodeLoading());

    final result = await verifyResetCodeUseCase(resetCode);

    result.fold(
      (failure) {
        emit(
          VerifyResetCodeFailure(failure.message),
        );
      },
      (message) {
        emit(
          VerifyResetCodeSuccess(message),
        );
      },
    );
  }
}
