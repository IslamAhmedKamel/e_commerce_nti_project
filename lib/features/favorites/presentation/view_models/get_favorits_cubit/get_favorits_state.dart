part of 'get_favorits_cubit.dart';

@immutable
sealed class GetFavoritsState {}

final class GetFavoritsInitial extends GetFavoritsState {}

final class GetFavoritsLoading extends GetFavoritsState {}

final class GetFavoritsSuceces extends GetFavoritsState {
  final List<ProductModel> products;

  GetFavoritsSuceces({required this.products});
}

final class GetFavoritsFailur extends GetFavoritsState {
  final String errorMessage;

  GetFavoritsFailur({required this.errorMessage});
}
