part of 'get_all_categories_cubit.dart';

@immutable
sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errorMessage;

  GetAllCategoriesFailure({required this.errorMessage});
}

final class GetAllCategoriesSucsecefull extends GetAllCategoriesState {
  final List<CategoryModel> categories;

  GetAllCategoriesSucsecefull({required this.categories});
}
