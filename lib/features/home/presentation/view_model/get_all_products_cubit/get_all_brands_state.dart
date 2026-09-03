part of 'get_all_brands_cubit.dart';

@immutable
sealed class GetAllBrandsState {}

final class GetAllProductsInitial extends GetAllBrandsState {}

final class GetAllProductsLoading extends GetAllBrandsState {}

final class GetAllProductsFailure extends GetAllBrandsState {
  final String errorMessage;

  GetAllProductsFailure({required this.errorMessage});
}

final class GetAllProductsSucsecefull extends GetAllBrandsState {
  final List<ProductModel> products;

  GetAllProductsSucsecefull({required this.products});
}
