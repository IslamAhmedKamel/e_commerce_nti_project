import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  final PageController _pageController;
  final int count;

  const CustomSmoothPageIndicator({
    super.key,
    required this.count,
    required PageController pageController,
  }) : _pageController = pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController, // ✅ نفس الـ Controller
      count: count,
      effect: WormEffect(
        dotColor: AppColors.orangeColor,
        activeDotColor: Colors.black,
        dotWidth: 10.w,
        dotHeight: 10.h,
      ),
    );
  }
}
