import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/catygroy_model.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit({required this.homeRepo})
    : super(GetAllCategoriesInitial());
  final HomeRepo homeRepo;
  void getData() async {
    emit(GetAllCategoriesLoading());
    var result = await homeRepo.getAllCategory();
    result.fold(
      (failed) {
        emit(GetAllCategoriesFailure(errorMessage: failed.errorMessage));
      },
      (categories) {
        emit(GetAllCategoriesSucsecefull(categories: categories));
      },
    );
  }
}
