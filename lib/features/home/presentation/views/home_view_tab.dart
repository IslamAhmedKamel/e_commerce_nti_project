import 'package:e_commerce_nti_project/core/utils/app_assets.dart';
import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/ads_list.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/all_brands_list.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/all_featured_list_veiw.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/searchany_product_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeViewTab extends StatelessWidget {
  const HomeViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppAssets.googleLogo),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.googleLogo,
                                width: 38.w,
                                height: 38.h,
                              ),
                              Gap(9.w),
                              Text(
                                "Stylish",
                                style: AppStyles.style18.copyWith(
                                  fontFamily: AppConstant.primFamilyFont,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 40.h,
                            child: Image.asset(AppAssets.onboarding3),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      SearchAnyProductTextField(),
                      Gap(16.h),
                      Text("All Categories"),
                      Gap(16.h),
                      AllFeaturedListVeiw(),
                      AdsList(),
                      Text("All Brands"),
                    ],
                  ),
                ),
                AllBrandsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
