part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

class SigninPasswordVisibilityChanged extends SigninState {}

final class SigninFailure extends SigninState {
  final String errMessage;

  SigninFailure({required this.errMessage});
}

final class SigninSuccess extends SigninState {
  final UserModel userModel;

  SigninSuccess({required this.userModel});
}
