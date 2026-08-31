import 'package:e_commerce_nti_project/core/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewRoot extends StatefulWidget {
  const HomeViewRoot({super.key});

  @override
  State<HomeViewRoot> createState() => _HomeViewRootState();
}

class _HomeViewRootState extends State<HomeViewRoot> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: BlocProvider.of<BottomNavCubit>(
              context,
            ).screens[BlocProvider.of<BottomNavCubit>(context).currentIndex],
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: Colors.transparent, // <-- لون الخلفية هنا
              iconSize: 20,
              onTap: (value) {
                BlocProvider.of<BottomNavCubit>(
                  context,
                ).onTap(currenIndex: value);
                if (value == 1) {
                  BlocProvider.of<GetFavoritsCubit>(context).getFavorits();
                }
              },
              currentIndex: BlocProvider.of<BottomNavCubit>(
                context,
              ).currentIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: AppColors.brownLightNavBarColor,
              unselectedLabelStyle: TextStyle(color: AppColors.blackColor),
              selectedItemColor: AppColors.primColor,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Settings",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
