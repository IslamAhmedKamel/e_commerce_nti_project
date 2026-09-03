import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/core/utils/functions/app_navigator.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigatePush(
          context: context,
          path: AppRouter.detailsPath,
          extra: productModel,
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 120.h,
                width: double.infinity,
                child: CachedNetworkImage(
                  height: 120.h,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  imageUrl: productModel.imageCover,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Gap(8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.style12,
                  ),
                  Gap(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${productModel.price}",
                        style: AppStyles.style12,
                      ),
                      // استخدام BlocBuilder واحد يسمع للكيوبتات المطلوبة
                      BlocBuilder<GetFavoritsCubit, GetFavoritsState>(
                        builder: (context, favoritsState) {
                          return IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review", style: AppStyles.style12),
                      Row(
                        children: [
                          Text(
                            "(${productModel.ratingsAverage})",
                            style: AppStyles.style12,
                          ),
                          Icon(Icons.star, color: AppColors.brownLightRGB),
                        ],
                      ),
                    ],
                  ),
                  // Gap(4.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
