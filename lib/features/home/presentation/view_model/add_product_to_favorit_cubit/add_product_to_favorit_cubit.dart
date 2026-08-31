// import 'package:e_commerce_app/core/share.dart';
// import 'package:e_commerce_app/core/utils/app_constatn.dart';
// import 'package:e_commerce_app/features/favorites/data/models/add_product_to_favorit_model_response.dart';
// import 'package:e_commerce_app/features/home/data/home_repo/home_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'add_product_to_favorit_state.dart';

// class AddProductToFavoritCubit extends Cubit<AddProductToFavoritState> {
//   AddProductToFavoritCubit({required this.homeRepo})
//     : super(AddProductToFavoritInitial());
//   List<String> prodsId = [];
//   final HomeRepo homeRepo;
//   Future<void> addProductToFavorit({required String productId}) async {
//     var result = await homeRepo.addProductToFavorit(
//       data: {"productId": productId},
//       headers: {
//         AppConstant.tokenKey: CacheHelper().getData(key: AppConstant.tokenKey),
//       },
//     );
//     result.fold(
//       (failed) {
//         emit(AddProductToFavoritFailure(errMessage: failed.errorMessage));
//       },
//       (sucecse) {
//         prodsId = [...sucecse.data!];
//         emit(
//           AddProductToFavoritSucsece(addProductToFavoritModelResponse: sucecse),
//         );
//       },
//     );
//   }
// }
