import 'package:dio/dio.dart';
import 'package:e_commerce_nti_project/core/api_service.dart';
import 'package:e_commerce_nti_project/core/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/data/auth_repo/auth_repo_implement.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_nti_project/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce_nti_project/features/favorites/data/favorit_repo/favorit_repo_impl.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo_impl.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_products_cubit/get_all_brands_cubit.dart';
import 'package:e_commerce_nti_project/features/splash/presentation/views/onboarding_view.dart';
import 'package:e_commerce_nti_project/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce_nti_project/home_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';

class AppRouter {
  static const onBoardingPath = '/OnBoardingView';
  static const signInPath = '/signInPath';
  static const signUpPath = '/sinUpPath';
  static const forgotPath = '/forgotPath';
  static const homePath = '/homePath';
  static const detailsPath = '/detailsPath';
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: onBoardingPath,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetAllCategoriesCubit(
                  homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())),
                ),
              ),
              BlocProvider(
                create: (context) => GetAllProductsCubit(
                  homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())),
                )..getData(),
              ),
              BlocProvider(
                create: (context) => GetFavoritsCubit(
                  favoritRepo: FavoritRepoImpl(
                    apiService: ApiService(dio: Dio()),
                  ),
                )..getFavorits(),
              ),
              BlocProvider(create: (context) => BottomNavCubit()),
            ],
            child: const HomeViewRoot(),
          );
        },
      ),
      GoRoute(
        path: signInPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SigninCubit(
              authRepo: AuthRepoImplement(apiService: ApiService(dio: Dio())),
            ),
            child: const SigninView(),
          );
        },
      ),
      GoRoute(
        path: signUpPath,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignupCubit(
              authRepo: AuthRepoImplement(apiService: ApiService(dio: Dio())),
            ),
            child: const SignupView(),
          );
        },
      ),
    ],
  );
}
