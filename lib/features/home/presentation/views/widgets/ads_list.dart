import 'dart:async';

import 'package:e_commerce_nti_project/core/utils/app_assets.dart';
import 'package:e_commerce_nti_project/core/widgets/smooth_page_indicator.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/custom_ads_list_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdsList extends StatefulWidget {
  const AdsList({super.key});

  @override
  State<AdsList> createState() => _AdsListState();
}

class _AdsListState extends State<AdsList> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  List<String> adsList = [
    AppAssets.ads1,
    AppAssets.ads2,
    AppAssets.ads3,
    AppAssets.ads4,
  ];
  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        // الانتقال إلى الصفحة التالية
        int nextPage = _currentPage + 1;
        // إذا وصلنا لآخر صفحة، نعود للأولى
        if (nextPage >= 4) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Column(
        children: [
          CustomAdsListPageView(
            pageController: _pageController,
            adsList: adsList,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Gap(8.h),
          CustomSmoothPageIndicator(
            pageController: _pageController,
            count: adsList.length,
          ),
        ],
      ),
    );
  }
}
