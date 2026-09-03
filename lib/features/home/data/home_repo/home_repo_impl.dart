import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_nti_project/core/api_service.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/favorites/data/models/add_product_to_favorit_model_response.dart';
import 'package:e_commerce_nti_project/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/catygroy_model.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory() async {
    try {
      var data = await apiService.getData(
        endPoint: AppConstant.categoriesEndPoint,
      );
      List<CategoryModel> categories = [];
      for (var category in data["data"]) {
        categories.add(CategoryModel.fromJson(category));
      }
      return right(categories);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.getData(endPoint: AppConstant.productsEndPoint);
      List<ProductModel> products = [];
      for (var product in data["data"]) {
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    } on Exception catch (dioExcep) {
      if (dioExcep is DioException) {
        return left(ServerFailure.fromDioEx(dioExcep));
      }
      return left(ServerFailure(errorMessage: dioExcep.toString()));
    }
  }

  @override
  Future<Either<Failure, AddProductToFavoritModelResponse>>
  addProductToFavorit({
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var reponse = await apiService.post(
        endPoint: AppConstant.wishlist,
        data: data,
        headers: headers,
      );
      AddProductToFavoritModelResponse product =
          AddProductToFavoritModelResponse.fromJson(reponse);
      return right(product);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
