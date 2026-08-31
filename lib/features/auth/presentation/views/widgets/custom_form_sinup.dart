import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:e_commerce_nti_project/core/utils/functions/show_toast.dart';
import 'package:e_commerce_nti_project/core/utils/widgets/custom_btn.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_text_field_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomFormSinup extends StatelessWidget {
  const CustomFormSinup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ShowToast.show(message: state.userModel.message, color: Colors.green);
          AppNavigator.navigatePushReplacement(
            context: context,
            path: AppRouter.signInPath,
          );
        } else if (state is SignupFailure) {
          ShowToast.show(message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        var signupCubit = context.read<SignupCubit>();
        return Form(
          key: signupCubit.formKey,
          child: Column(
            children: [
              CustomTextFieldSinUp(
                controller: signupCubit.nameController,
                title: "Full Name",
                hintText: "Jane Doe",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  if (value.length < 3) {
                    return 'Username must be at least 3 characters';
                  }
                  if (value.length > 20) {
                    return 'Username must be less than 20 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                    return 'Username can only contain letters, numbers, and underscores';
                  }
                  return null;
                },
              ),
              const Gap(16),
              CustomTextFieldSinUp(
                controller: signupCubit.emailController,
                title: "Email Address",
                hintText: "jane@example.com",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_rounded),
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
              CustomTextFieldSinUp(
                controller: signupCubit.passwordController,
                title: " Password",
                hintText: "••••••••",
                obscureText: signupCubit.isPasswordVisible,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: signupCubit.isPasswordVisible != true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed:
                      signupCubit.togglePasswordVisibility, // ✅ دالة منفصلة

                  color: AppColors.brownLight,
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
              const Gap(16),
              CustomTextFieldSinUp(
                controller: signupCubit.rePasswordController,
                title: "Confirm Password",
                hintText: "••••••••",
                obscureText:
                    signupCubit.isConfirmPasswordVisible, // ✅ متغير منفصل
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: signupCubit.isConfirmPasswordVisible != true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: signupCubit
                      .toggleConfirmPasswordVisibility, // ✅ دالة منفصلة

                  color: AppColors.brownLight,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != signupCubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              Gap(16.h),
              state is SignupLoading
                  ? CupertinoActivityIndicator(
                      color: AppColors.orangeColor,
                      radius: 15.r,
                    )
                  : CustomBtn(
                      title: 'Sign Up',
                      onTap: context.read<SignupCubit>().signUp,
                    ),
              
              
              
              Gap(50.h),
            ],
          ),
        );
      },
    );
  }
}
