part of 'bottom_nav_cubit.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitialHomeView extends BottomNavState {}

final class BottomNavCartView extends BottomNavState {}
final class BottomNavProductsView extends BottomNavState {}

final class BottomNavSettingsView extends BottomNavState {}

final class BottomNavFavoriteView extends BottomNavState {}
