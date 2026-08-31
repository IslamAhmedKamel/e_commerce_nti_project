import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.push(context: context, path: AppRouter.forgotPath);
      },
      child: Align(
        alignment: AlignmentGeometry.centerEnd,
        child: Text(
          "Forgot Password?",
          style: AppStyles.style16.copyWith(color: AppColors.primColor),
        ),
      ),
    );
  }
}
