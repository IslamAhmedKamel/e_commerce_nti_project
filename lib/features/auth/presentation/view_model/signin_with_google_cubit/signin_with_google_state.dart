part of 'signin_with_google_cubit.dart';

@immutable
sealed class SigninWithGoogleState {}

final class SigninWithGoogleInitial extends SigninWithGoogleState {}

final class SigninWithGoogleSuccess extends SigninWithGoogleState {}

final class SigninWithGoogleFailure extends SigninWithGoogleState {}

final class SigninWithGoogleLoading extends SigninWithGoogleState {}
