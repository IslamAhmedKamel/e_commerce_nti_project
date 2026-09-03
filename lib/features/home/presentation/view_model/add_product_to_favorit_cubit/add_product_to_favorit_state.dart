

import 'package:e_commerce_nti_project/features/favorites/data/models/add_product_to_favorit_model_response.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AddProductToFavoritState {}

final class AddProductToFavoritInitial extends AddProductToFavoritState {}
final class AddProductToFavoritLoading extends AddProductToFavoritState {}

final class AddProductToFavoritSucsece extends AddProductToFavoritState {
  final AddProductToFavoritModelResponse addProductToFavoritModelResponse;

  AddProductToFavoritSucsece({required this.addProductToFavoritModelResponse});
}

final class AddProductToFavoritFailure extends AddProductToFavoritState {
  final String errMessage;
  AddProductToFavoritFailure({required this.errMessage});
}
