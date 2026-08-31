import 'package:e_commerce_nti_project/core/utils/app_assets.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/views/widgets/favorit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class FavoriteViewTab extends StatelessWidget {
  const FavoriteViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<GetFavoritsCubit, GetFavoritsState>(
          builder: (BuildContext context, GetFavoritsState state) {
            if (state is GetFavoritsSuceces) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Favorits Products ", style: AppStyles.style14),
                      Badge(
                        label: Text(
                          "${BlocProvider.of<GetFavoritsCubit>(context).count}",
                        ),
                        child: SvgPicture.asset(AppAssets.googleLogo),
                      ),
                    ],
                  ),
                  Gap(32.h),

                  Expanded(
                    child: state.products.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: (context, index) => FavoritProduct(
                              productModel: state.products[index],
                            ),
                          )
                        : Center(
                            child: Text(
                              "There is not a favorit yet , please try add",
                            ),
                          ),
                  ),
                ],
              );
            } else if (state is GetFavoritsFailur) {
              return Expanded(child: Center(child: Text(state.errorMessage)));
            } else if (state is GetFavoritsLoading) {
              return Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return Gap(0.0);
            }
          },
        ),
      ),
    );
  }
}
