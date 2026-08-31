import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/favorit_repo/favorit_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_favorits_state.dart';

class GetFavoritsCubit extends Cubit<GetFavoritsState> {
  GetFavoritsCubit({required this.favoritRepo}) : super(GetFavoritsInitial());
  final FavoritRepo favoritRepo;
  int count = 0;
  List<ProductModel> prods = [];
  Future<void> getFavorits() async {
    emit(GetFavoritsLoading());
    var result = await favoritRepo.getFavorits(
      headers: {
        AppConstant.tokenKey: CacheHelper.getData(key: AppConstant.tokenKey),
      },
    );

    result.fold(
      (failed) {
        emit(GetFavoritsFailur(errorMessage: failed.errorMessage));
      },
      (succese) {
        prods = [...succese];
        count = succese.length;
        emit(GetFavoritsSuceces(products: succese));
      },
    );
  }
}
