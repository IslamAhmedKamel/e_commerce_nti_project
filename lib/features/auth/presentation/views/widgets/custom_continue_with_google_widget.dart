import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:e_commerce_nti_project/core/utils/functions/show_toast.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signin_with_google_cubit/signin_with_google_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/signin_with_google_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomContinueWithGoogleWidget extends StatelessWidget {
  const CustomContinueWithGoogleWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninWithGoogleCubit, SigninWithGoogleState>(
      listener: (context, state) {
        if (state is SigninWithGoogleSuccess) {
          ShowToast.show(
            message: "تم تسجيل الدخول بواسطة جوجل بنجاح",
            color: Colors.green,
          );
          AppNavigator.navigatePushReplacement(
            context: context,
            path: AppRouter.homePath,
          );
        } else if (state is SigninWithGoogleFailure) {
          ShowToast.show(message: "فشل تسجيل الدخول", color: Colors.red);
        }
      },
    
    
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1.5.h,
                    color: AppColors.orangeLigth,
                  ),
                ),
                Gap(16.w),
                Text(
                  "OR CONTINUE WITH",
                  style: AppStyles.style12.copyWith(
                    color: color ?? AppColors.brownLight,
                  ),
                ),
                Gap(16.w),
                Expanded(
                  child: Divider(
                    thickness: 1.5.h,
                    color: AppColors.orangeLigth,
                  ),
                ),
              ],
            ),
            Gap(24.h),
            SigninWithGoogleWidget(
              onTap: () {
                context.read<SigninWithGoogleCubit>().signinWithGoogle();
              },
            ),
          ],
        );
      },
    );
  }
}
