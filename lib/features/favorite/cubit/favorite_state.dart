import 'package:furniture_app/features/home/model/home_model/product_model.dart';

import '../../cart/model/model/cart_products_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}
class FavoriteErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteErrorState({required this.errorMessage});
}

class FavoriteLoaded extends FavoriteState {
  final List<ProductModel> allFavorites;
  final List<ProductModel> filteredFavorites;
  final String searchQuery;

  FavoriteLoaded(
      {required this.allFavorites,
        required this.filteredFavorites,
        this.searchQuery = ''});
}
