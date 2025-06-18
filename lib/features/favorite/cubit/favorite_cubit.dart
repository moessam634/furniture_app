import 'package:bloc/bloc.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/local_storage_service.dart';
import '../../home/model/home_model/product_model.dart';
import '../../cart/model/model/cart_item_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductModel> _allFavorites = [];

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      _allFavorites = await sl<LocalStorageService>().loadFavorites();
      emit(FavoriteLoaded(
          allFavorites: _allFavorites,
          filteredFavorites: _allFavorites
      ));
    } catch (e) {
      emit(FavoriteLoaded(allFavorites: [], filteredFavorites: []));
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    try {
      final exists = _allFavorites.any((item) => item.id == product.id);

      if (exists) {
        _allFavorites.removeWhere((item) => item.id == product.id);
        await sl<LocalStorageService>().removeFromFavorites(product.id!);
      } else {
        _allFavorites.add(product);
        await sl<LocalStorageService>().addToFavorites(product);
      }

      // Update the state with current search query if exists
      final currentState = state;
      String searchQuery = '';
      if (currentState is FavoriteLoaded) {
        searchQuery = currentState.searchQuery;
      }

      if (searchQuery.isNotEmpty) {
        searchFavorites(searchQuery);
      } else {
        emit(FavoriteLoaded(
          allFavorites: _allFavorites,
          filteredFavorites: _allFavorites,
        ));
      }
    } catch (e) {
      // Handle error if needed
      print('Error toggling favorite: $e');
    }
  }

  bool isFavorite(int productId) {
    return _allFavorites.any((item) => item.id == productId);
  }

  Future<void> clearFavorites() async {
    try {
      _allFavorites.clear();
      await sl<LocalStorageService>().clearFavorites();
      emit(FavoriteLoaded(allFavorites: [], filteredFavorites: []));
    } catch (e) {
      print('Error clearing favorites: $e');
    }
  }

  void searchFavorites(String query) {
    final results = _allFavorites.where((item) {
      final name = item.name.toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    emit(FavoriteLoaded(
        allFavorites: _allFavorites,
        filteredFavorites: results,
        searchQuery: query
    ));
  }

  Future<bool> addAllFavoritesToCart() async {
    try {
      final currentCart = await sl<LocalStorageService>().loadCart();
      bool hasChanges = false;

      for (var favorite in _allFavorites) {
        // Check if product already exists in cart by comparing product IDs
        final alreadyInCart = currentCart.any((cartItem) =>
        cartItem.product.id == favorite.id);

        if (!alreadyInCart) {
          // Create CartItemModel from ProductModel
          final cartItem = CartItemModel(
            id: DateTime.now().millisecondsSinceEpoch + favorite.id.hashCode,
            product: favorite,
            quantity: 1, // Default quantity
          );

          // Use the addToCart method instead of manually adding
          final success = await sl<LocalStorageService>().addToCart(cartItem);
          if (success) {
            hasChanges = true;
          }
        }
      }

      return hasChanges;
    } catch (e) {
      print('Error adding all favorites to cart: $e');
      return false;
    }
  }

  // Method to add specific favorite to cart
  Future<bool> addFavoriteToCart(ProductModel product, {int quantity = 1}) async {
    try {
      final currentCart = await sl<LocalStorageService>().loadCart();

      // Check if product already exists in cart by comparing product IDs
      final alreadyInCart = currentCart.any((cartItem) =>
      cartItem.product.id == product.id);

      if (!alreadyInCart) {
        // Create CartItemModel from ProductModel
        final cartItem = CartItemModel(
          id: DateTime.now().millisecondsSinceEpoch,
          product: product,
          quantity: quantity,
        );

        return await sl<LocalStorageService>().addToCart(cartItem);
      } else {
        // Product already in cart, you might want to update quantity instead
        // or just return true if you don't want to change anything
        return true;
      }
    } catch (e) {
      print('Error adding favorite to cart: $e');
      return false;
    }
  }

  // Get filtered favorites for current search
  List<ProductModel> get filteredFavorites {
    final currentState = state;
    if (currentState is FavoriteLoaded) {
      return currentState.filteredFavorites;
    }
    return [];
  }

  // Get all favorites
  List<ProductModel> get allFavorites => _allFavorites;
}