import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppStyles.style16,
        children: [
          TextSpan(text: "By clicking the "),
          TextSpan(
            text: "Register ",
            style: AppStyles.style16.copyWith(color: AppColors.primColor),
          ),
          TextSpan(text: "button, you agree to the public offer"),
        ],
      ),
    );
  }
}
