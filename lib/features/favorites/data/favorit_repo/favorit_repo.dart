import 'package:dartz/dartz.dart';
import 'package:e_commerce_nti_project/core/errors/failure.dart';
import 'package:e_commerce_nti_project/features/home/data/models/product_model.dart';

abstract class FavoritRepo {
  Future<Either<Failure, List<ProductModel>>> getFavorits({  Map<String, dynamic>? headers,});
}
