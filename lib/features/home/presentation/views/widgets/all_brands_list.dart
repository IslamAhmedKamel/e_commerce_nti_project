import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/get_all_products_cubit/get_all_brands_cubit.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/featured_item.dart';
import 'package:e_commerce_nti_project/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllBrandsList extends StatelessWidget {
  const AllBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
        builder: (context, state) {
          if (state is GetAllProductsSucsecefull) {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) =>
                  ProductItem(productModel: state.products[index]),
            );
          } else if (state is GetAllProductsFailure) {
            return Center(
              child: Text(state.errorMessage, style: AppStyles.style12),
            );
          } else if (state is GetAllProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Gap(0);
        },
      ),
    );
  }
}

// class ProductItem extends StatelessWidget {
//   const ProductItem({super.key, required this.productModel});
//   final ProductModel productModel;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: 100.w,
//         height: 100.h,
//         color: Colors.grey[200],
//         child: Center(child: Text("Product", style: AppStyles.style12)),
//       ),
//     );
//   }
// }
