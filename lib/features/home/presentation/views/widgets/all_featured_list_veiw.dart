import 'dart:developer';

import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllFeaturedListVeiw extends StatefulWidget {
  const AllFeaturedListVeiw({super.key});

  @override
  State<AllFeaturedListVeiw> createState() => _AllFeaturedListVeiwState();
}

class _AllFeaturedListVeiwState extends State<AllFeaturedListVeiw> {
  late ScrollController _scrollController;
  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        log('Reached the end of the list');
      }
    });
  }

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
      ),
      height: 100.h,
      child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
        builder: (context, state) {
          if (state is GetAllCategoriesSucsecefull) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) =>
                  CategoryItem(categoryModel: state.categories[index]),
            );
          } else if (state is GetAllCategoriesFailure) {
            return Center(
              child: Text(state.errorMessage, style: AppStyles.style12),
            );
          } else if (state is GetAllCategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Gap(0);
        },
      ),
    );
  }
}
