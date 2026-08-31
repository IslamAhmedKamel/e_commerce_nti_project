import 'dart:async';
import 'dart:developer';

import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool? isVisited = CacheHelper.getData(key: AppConstant.isVisitedOnboarding);
    bool? islogin = CacheHelper.getData(key: AppConstant.islogin);
    Timer(Duration(seconds: 4), () {
      if (isVisited == true) {
        log("islogin  $islogin");
        log("isVisited  $isVisited");
        if (islogin == true) {
          AppNavigator.navigatePushReplacement(
            context: context,
            path: AppRouter.homePath,
          );
        } else {
          AppNavigator.navigatePushReplacement(
            context: context,
            path: (AppRouter.signUpPath),
          );
        }
      } else {
        AppNavigator.navigatePushReplacement(
          context: context,
          path: AppRouter.onBoardingPath,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen_backgrond.png"),
            fit: BoxFit.fill,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadingText(
              'SKATEE',
              style: TextStyle(
                color: AppColors.primColor,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "BOUTIQUE",
              style: TextStyle(
                color: Color(0xff89726D),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
