import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';
 import 'package:store_app/features/auth/sign_in/domain/usecase/signin_use_cae.dart';
import 'package:store_app/features/auth/sign_in/presentation/cubit/sing_in_state.dart';

 
@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit(this.signInUseCase)
      : super(SignInInitial());

  Future<void> signIn(SignInRequestModel request) async {
    emit(SignInLoading());

    final result = await signInUseCase(request);

    result.fold(
      (failure) {
        emit(SignInFailure(failure));
      },
      (user) {
        emit(SignInSuccess(user));
      },
    );
  }
}