import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdsListPageView extends StatelessWidget {
  const CustomAdsListPageView({
    super.key,
    this.onPageChanged,
    required this.pageController,
    required this.adsList,
  });
  final void Function(int)? onPageChanged;
  final PageController pageController;
  final List adsList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 189.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: adsList.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            height: 189.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(adsList[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
