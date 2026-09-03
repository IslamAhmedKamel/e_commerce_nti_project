part of 'get_all_brands_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsFailure extends GetAllProductsState {
  final String errorMessage;

  GetAllProductsFailure({required this.errorMessage});
}

final class GetAllProductsSucsecefull extends GetAllProductsState {
  final List<ProductModel> products;

  GetAllProductsSucsecefull({required this.products});
}
