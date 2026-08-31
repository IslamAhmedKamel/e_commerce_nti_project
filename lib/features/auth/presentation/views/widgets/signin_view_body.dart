import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_form_signin.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orangeLigth),
        borderRadius: BorderRadius.circular(48.r),
      ),

      child: Column(
        children: [
          CustomFormSignin(),
        ],
      ),
    );
  }
}
