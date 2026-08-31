import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_products_cubit/get_all_brands_cubit.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AllBrandsList extends StatelessWidget {
  const AllBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
        builder: (context, state) {
          if (state is GetAllBrandsSucsecefull) {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) =>
                  CategoryItem(categoryModel: state.products[index]),
            );
          } else if (state is GetAllBrandsFailure) {
            return Center(
              child: Text(state.errorMessage, style: AppStyles.style12),
            );
          } else if (state is GetAllBrandsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Gap(0);
        },
      ),
    );
  }
}
