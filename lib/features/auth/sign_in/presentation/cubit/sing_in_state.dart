import 'package:equatable/equatable.dart';
import 'package:store_app/core/error/failures/failures.dart';
import 'package:store_app/features/auth/shared/user_entity.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;

  const SignInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignInFailure extends SignInState {
  final Failure failure;

  const SignInFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}