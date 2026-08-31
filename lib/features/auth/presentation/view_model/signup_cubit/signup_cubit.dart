import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerce_nti_project/features/auth/data/models/signup_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    emit(SignupLoading());
    SignUpModel signUpData = SignUpModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
      phone: "01154562919",
    );
    var result = await authRepo.signup(signUpData: signUpData);
    result.fold(
      (fail) {
        emit(SignupFailure(errMessage: fail.errorMessage));
      },
      (success) {
        reset();
        emit(SignupSuccess(userModel: success));
        CacheHelper.saveData(key: AppConstant.islogin, value: true);
        CacheHelper.saveData(key: AppConstant.tokenKey, value: success.token);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(success.token);
        CacheHelper.saveData(key: AppConstant.idKey, value: decodedToken["id"]);
      },
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SignupPasswordVisibilityChanged()); // إعادة البناء
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(SignupPasswordVisibilityChanged()); // إعادة البناء
  }

  void reset() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    formKey.currentState?.reset();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    phoneController.clear();
    emit(SignupInitial());
  }

  // تنظيف الموارد
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
  }
}
