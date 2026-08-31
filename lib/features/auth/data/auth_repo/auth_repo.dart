import 'package:dartz/dartz.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/forgot_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signin_request_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signup_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signup({required SignUpModel signUpData});
  Future<Either<Failure, UserModel>> signin({required SignInModel signinData});
  Future<Either<Failure, ForgotResponseModel>> forgotPassword({
    required String email,
  });
}
