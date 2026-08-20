import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/sign_up/domain/usecases/signup_use_case.dart';
import 'package:store_app/features/auth/sign_up/presentation/cubit/signup_state.dart';

 
@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase)
      : super(const SignupInitial());

  Future<void> signUp(
    SignupRequestModel request,
  ) async {
    emit(const SignupLoading());

    final result = await signupUseCase(request);

    result.fold(
      (failure) {
        emit(
          SignupFailure(failure),
        );
      },
      (user) {
        emit(
          SignupSuccess(user),
        );
      },
    );
  }
}