part of 'get_all_brands_cubit.dart';

@immutable
sealed class GetAllBrandsState {}

final class GetAllBrandsInitial extends GetAllBrandsState {}

final class GetAllBrandsLoading extends GetAllBrandsState {}

final class GetAllBrandsFailure extends GetAllBrandsState {
  final String errorMessage;

  GetAllBrandsFailure({required this.errorMessage});
}

final class GetAllBrandsSucsecefull extends GetAllBrandsState {
  final List<CategoryModel> products;

  GetAllBrandsSucsecefull({required this.products});
}
