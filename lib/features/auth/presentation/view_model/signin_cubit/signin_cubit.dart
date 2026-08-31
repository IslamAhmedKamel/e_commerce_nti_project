import 'dart:developer';

import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signin_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.authRepo}) : super(SigninInitial());
  final AuthRepo authRepo;
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signin() async {
    if (!formKey.currentState!.validate()) return;
    emit(SigninLoading());
    SignInModel signinData = SignInModel(
      email: emailController.text,
      password: passwordController.text,
    );
    var result = await authRepo.signin(signinData: signinData);
    result.fold(
      (fail) {
        emit(SigninFailure(errMessage: fail.errorMessage));
      },
      (success) {
        CacheHelper.saveData(key: AppConstant.islogin, value: true);
        CacheHelper.saveData(key: AppConstant.tokenKey, value: success.token);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(success.token);
        CacheHelper.saveData(key: AppConstant.idKey, value: decodedToken["id"]);
        reset();
        log(success.message);
        emit(SigninSuccess(userModel: success));
      },
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SigninPasswordVisibilityChanged());
  }

  void reset() {
    isPasswordVisible = false;
    formKey.currentState?.reset();
    emailController.clear();
    passwordController.clear();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
