import 'dart:developer';

import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/core/utils/widgets/custom_btn.dart';
import 'package:e_commerce_nti_project/features/splash/presentation/views/widgets/custom_page_view_body.dart';
import 'package:e_commerce_nti_project/features/splash/presentation/views/widgets/skip_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController controller;
  int currentValu = 0;
  @override
  void initState() {
    controller = PageController(initialPage: currentValu);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentValu != 0
                      ? GestureDetector(
                          onTap: () {
                            controller.previousPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.brownLight,
                            size: 25.w,
                          ),
                        )
                      : Gap(0),
                  Spacer(),
                  Text(
                    'Skatee',
                    style: TextStyle(
                      color: AppColors.primColor,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  SkipText(
                    title: "Skip",
                    onTap: () {
                      CacheHelper.saveData(
                        key: AppConstant.isVisitedOnboarding,
                        value: true,
                      );
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.signUpPath);
                    },
                  ),
                ],
              ),
              Gap(16),
              CustomPageViewBody(
                currentIndex: currentValu,
                controller: controller,
                onPageChanged: (valu) {
                  setState(() {
                    currentValu = valu;
                  });
                  log("$currentValu");
                },
              ),
              Gap(30.h),
              CustomBtn(
                onTap: currentValu == 2
                    ? () {
                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRouter.signUpPath);
                        CacheHelper.saveData(
                          key: AppConstant.isVisitedOnboarding,
                          value: true,
                        );
                      }
                    : () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                title: "Next ",
              ),
              Gap(50.h),
            ],
          ),
        ),
      ),
    );
  }
}
