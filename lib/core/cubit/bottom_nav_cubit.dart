import 'package:e_commerce_nti_project/features/cart/views/cart_view_tab.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/views/favorite_view_tab.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/home_view_tab.dart';
import 'package:e_commerce_nti_project/features/settings/presentation/views/settings_view_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitialHomeView());
  List<Widget> screens = [
    HomeViewTab(),
    FavoriteViewTab(),
    CartViewTab(),
    SettingsViewTab(),
  ];
  int currentIndex = 0;
  void onTap({required int currenIndex}) {
    currentIndex = currenIndex;
    if (currenIndex == 1) {
      emit(BottomNavProductsView());
    } else if (currenIndex == 2) {
      emit(BottomNavFavoriteView());
    } else if (currenIndex == 3) {
      emit(BottomNavCartView());
    } else if (currenIndex == 4) {
      emit(BottomNavSettingsView());
    } else {
      emit(BottomNavInitialHomeView());
    }
  }
}
