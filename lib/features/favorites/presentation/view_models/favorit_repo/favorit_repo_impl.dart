import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_nti_project/core/api_service.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:e_commerce_nti_project/features/favorites/presentation/view_models/favorit_repo/favorit_repo.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';

class FavoritRepoImpl extends FavoritRepo {
  final ApiService apiService;

  FavoritRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> getFavorits({
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await apiService.getData(
        endPoint: AppConstant.wishlist,
        headers: headers,
      );
      List<ProductModel> data = [];
      for (var product in response["data"]) {
        data.add(ProductModel.fromJson(product));
      }
      return right(data);
      // return right(response.da)
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
