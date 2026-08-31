import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/splash/presentation/view_mode/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomPageViewBody extends StatelessWidget {
  const CustomPageViewBody({
    super.key,
    required this.controller,
    this.onPageChanged,
    required this.currentIndex,
  });
  final PageController controller;
  final void Function(int)? onPageChanged;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: OnboardingModel.onboardinList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: double.infinity,
              height: 360.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(OnboardingModel.onboardinList[index].image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Gap(20.h),
            Text(
              OnboardingModel.onboardinList[index].title,
              textAlign: TextAlign.center,
              style: AppStyles.style28,
            ),
            Gap(16.h),
            Text(
              OnboardingModel.onboardinList[index].description,
              textAlign: TextAlign.center,
              style: AppStyles.style16,
            ),
            Expanded(child: Gap(1)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(OnboardingModel.onboardinList.length, (
                index,
              ) {
                final isActive = currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 35.w : 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.orangeColor
                        : AppColors.orangeLigth,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
