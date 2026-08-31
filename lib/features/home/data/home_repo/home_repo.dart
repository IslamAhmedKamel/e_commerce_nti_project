import 'package:dartz/dartz.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/features/favorites/data/models/add_product_to_favorit_model_response.dart';
import 'package:e_commerce_nti_project/features/home/data/models/catygroy_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategory();
  Future<Either<Failure, List<CategoryModel>>> getAllBrands();
  Future<Either<Failure, AddProductToFavoritModelResponse>>
  addProductToFavorit({
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  });
}
