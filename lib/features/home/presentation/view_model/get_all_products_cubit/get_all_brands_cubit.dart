import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_brands_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit({required this.homeRepo})
    : super(GetAllProductsInitial());

  final HomeRepo homeRepo;
  void getData() async {
    emit(GetAllProductsLoading());
    var result = await homeRepo.getAllProducts();
    result.fold(
      (failed) {
        emit(GetAllProductsFailure(errorMessage: failed.errorMessage));
      },
      (brands) {
        emit(GetAllProductsSucsecefull(products: brands));
      },
    );
  }
}
