import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/catygroy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_brands_state.dart';

class GetAllBrandsCubit extends Cubit<GetAllBrandsState> {
  GetAllBrandsCubit({required this.homeRepo}) : super(GetAllBrandsInitial());

  final HomeRepo homeRepo;
  void getData() async {
    emit(GetAllBrandsLoading());
    var result = await homeRepo.getAllBrands();
    result.fold(
      (failed) {
        emit(GetAllBrandsFailure(errorMessage: failed.errorMessage));
      },
      (brands) {
        emit(GetAllBrandsSucsecefull(products: brands));
      },
    );
  }
}
