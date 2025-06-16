import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/home/model/home_model/product_model.dart';
import '../../../core/utils/local_storage_service.dart';
import '../../../core/utils/service_locator.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductModel> _allFavorites = [];

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    _allFavorites = await sl<LocalStorageService>().loadFavorites();
    emit(FavoriteLoaded(
        allFavorites: _allFavorites, filteredFavorites: _allFavorites));
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final exists = _allFavorites.any((item) => item.id == product.id);
    if (exists) {
      _allFavorites.removeWhere((item) => item.id == product.id);
    } else {
      _allFavorites.add(product);
    }
    await sl<LocalStorageService>().saveFavorites(_allFavorites);
    emit(FavoriteLoaded(
      allFavorites: _allFavorites,
      filteredFavorites: _allFavorites,
    ));
  }

  bool isFavorite(int productId) {
    return _allFavorites.any((item) => item.id == productId);
  }

  Future<void> clearFavorites() async {
    _allFavorites.clear();
    await sl<LocalStorageService>().clearFavorites();
    emit(FavoriteLoaded(allFavorites: [], filteredFavorites: []));
  }

  void searchFavorites(String query) {
    final results = _allFavorites.where((item) {
      final name = item.name!.toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    emit(FavoriteLoaded(
        allFavorites: _allFavorites,
        filteredFavorites: results,
        searchQuery: query));
  }
  Future<void> addToCart({required int productId, int? quantity}) async {
    final currentCart = await sl<LocalStorageService>().loadFavorites();
    for (var fav in _allFavorites) {
      final alreadyInCart =
          currentCart.any((item) => item.id == fav.id);
      if (!alreadyInCart) {
        currentCart.add(fav);
      }
      await sl<LocalStorageService>().saveFavorites(currentCart);
    }
  }

}
