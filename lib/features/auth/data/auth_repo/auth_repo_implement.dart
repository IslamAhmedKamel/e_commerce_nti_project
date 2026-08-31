import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_nti_project/core/api_service.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/forgot_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signin_request_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signup_request_model.dart';

class AuthRepoImplement extends AuthRepo {
  final ApiService apiService;

  AuthRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, UserModel>> signup({
    required SignUpModel signUpData,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: AppConstant.signUp,
        data: signUpData.toJson(),
      );
      var user = UserModel.fromJson(response);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signin({
    required SignInModel signinData,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: AppConstant.signIn,
        data: signinData.toJson(),
      );
      var user = UserModel.fromJson(response);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgotResponseModel>> forgotPassword({
    required String email,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: AppConstant.forgotPassword,
        data: {"email": email},
      );
      var user = ForgotResponseModel.fromJson(response);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
