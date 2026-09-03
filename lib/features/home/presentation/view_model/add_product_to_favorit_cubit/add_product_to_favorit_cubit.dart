import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_nti_project/features/home/presentation/view_model/add_product_to_favorit_cubit/add_product_to_favorit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductToFavoritCubit extends Cubit<AddProductToFavoritState> {
  AddProductToFavoritCubit({required this.homeRepo})
    : super(AddProductToFavoritInitial());

  List<String> prodsId = [];

  final HomeRepo homeRepo;

  bool isFavorite(String productId) {
    return prodsId.contains(productId);
  }

  Future<void> addProductToFavorit({required String productId}) async {
    var result = await homeRepo.addProductToFavorit(
      data: {"productId": productId},
      headers: {
        AppConstant.tokenKey: CacheHelper.getData(key: AppConstant.tokenKey),
      },
    );

    result.fold(
      (failed) {
        emit(AddProductToFavoritFailure(errMessage: failed.errorMessage));
      },
      (success) {
        prodsId = [...success.data!];

        emit(
          AddProductToFavoritSucsece(addProductToFavoritModelResponse: success),
        );
      },
    );
  }
}
