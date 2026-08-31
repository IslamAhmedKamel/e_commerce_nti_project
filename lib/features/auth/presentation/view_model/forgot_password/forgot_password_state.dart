part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String errMessage;

  ForgotPasswordFailure({required this.errMessage});
}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotResponseModel forgotResponseModel;

  ForgotPasswordSuccess({required this.forgotResponseModel});
}
