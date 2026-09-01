import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:e_commerce_nti_project/core/utils/functions/show_toast.dart';
import 'package:e_commerce_nti_project/core/utils/widgets/custom_btn.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signin_with_google_cubit/signin_with_google_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_continue_with_google_widget.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_text_field_signin.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/forgot_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomFormSignin extends StatelessWidget {
  const CustomFormSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          ShowToast.show(message: state.userModel.message, color: Colors.green);
          AppNavigator.navigatePushReplacement(
            context: context,
            path: AppRouter.homePath,
          );
        } else if (state is SigninFailure) {
          ShowToast.show(message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        var signinCubit = context.read<SigninCubit>();
        return Form(
          key: signinCubit.formKey,
          child: Column(
            children: [
              Column(
                children: [
                  CustomTextFieldSignIn(
                    controller: signinCubit.emailController,
                    title: "Email Address",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // تحقق من صحة البريد الإلكتروني
                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextFieldSignIn(
                    controller: signinCubit.passwordController,
                    title: "Password",
                    // controller: signin.passwordController,
                    hintText: "Password",
                    obscureText: signinCubit.isPasswordVisible,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: signinCubit.isPasswordVisible != true
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: signinCubit.togglePasswordVisibility,

                      color: AppColors.blackColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (value.length > 20) {
                        return 'Password must be less than 20 characters';
                      }
                      // تحقق من وجود حرف كبير
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      // تحقق من وجود حرف صغير
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter';
                      }
                      // تحقق من وجود رقم
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      }
                      // تحقق من وجود رمز خاص
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
                  ),
                  Gap(16.h),

                  Gap(12.h),
                  ForgotPasswordWidget(),
                  Gap(32.h),
                  state is SigninLoading
                      ? CupertinoActivityIndicator(
                          color: AppColors.orangeColor,
                          radius: 15.r,
                        )
                      : CustomBtn(title: 'Login', onTap: signinCubit.signin),
                  Gap(50.h),
              
              
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
