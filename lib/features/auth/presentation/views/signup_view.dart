import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_continue_with_google_widget.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_form_sinup.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteLigth,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(32.h),
                  Text("Join Skatee", style: AppStyles.style28),
                  Gap(12.h),
                  Text(
                    "Sign up to start your fashion journey.",
                    style: AppStyles.style16,
                  ),
                  Gap(32.h),
                  CustomFormSinup(),
                  
                  CustomContinueWithGoogleWidget(),
                  HaveAnAccount(
                    onTap: () {
                      AppNavigator.navigatePushReplacement(
                        context: context,
                        path: AppRouter.signInPath,
                      );
                    },
                    title: "Already have an account? ",
                    wayRegisterText: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
