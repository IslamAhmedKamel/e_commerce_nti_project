import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signin_with_google_cubit/signin_with_google_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_continue_with_google_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocProvider(
            create: (context) => SigninWithGoogleCubit(),
            child: CustomContinueWithGoogleWidget(
              color: AppColors.brownLightRGB,
            ),
          ),
        ],
      ),
    );
  }
}
