
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/cart/model/model/cart_item_model.dart';
import '../../features/home/model/home_model/product_model.dart';


class LocalStorageService {
  static const String _favoritesKey = 'favorites';
  static const String _cartKey = 'cart';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<List<ProductModel>> loadFavorites() async {
    try {
      final favoritesJson = _prefs?.getStringList(_favoritesKey) ?? [];
      return favoritesJson
          .map((item) => ProductModel.fromJson(jsonDecode(item)))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> saveFavorites(List<ProductModel> favorites) async {
    try {
      final favoritesJson = favorites
          .map((item) => jsonEncode(item.toJson()))
          .toList();
      return await _prefs?.setStringList(_favoritesKey, favoritesJson) ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearFavorites() async {
    try {
      return await _prefs?.remove(_favoritesKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addToFavorites(ProductModel product) async {
    try {
      final favorites = await loadFavorites();
      if (!favorites.any((item) => item.id == product.id)) {
        favorites.add(product);
        return await saveFavorites(favorites);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromFavorites(int productId) async {
    try {
      final favorites = await loadFavorites();
      favorites.removeWhere((item) => item.id == productId);
      return await saveFavorites(favorites);
    } catch (e) {
      return false;
    }
  }

  Future<bool> isFavorite(int productId) async {
    try {
      final favorites = await loadFavorites();
      return favorites.any((item) => item.id == productId);
    } catch (e) {
      return false;
    }
  }

  Future<List<CartItemModel>> loadCart() async {
    try {
      await init();
      final cartJson = _prefs?.getStringList(_cartKey) ?? [];
      return cartJson
          .map((item) => CartItemModel.fromJson(jsonDecode(item)))
          .toList();
    } catch (e) {
      print('Error loading cart: $e');
      return [];
    }
  }

  Future<bool> saveCart(List<CartItemModel> cartItems) async {
    try {
      await init();
      final cartJson = cartItems
          .map((item) => jsonEncode(item.toJson()))
          .toList();
      return await _prefs?.setStringList(_cartKey, cartJson) ?? false;
    } catch (e) {
      print('Error saving cart: $e');
      return false;
    }
  }

  Future<bool> addToCart(CartItemModel newItem) async {
    try {
      final currentCart = await loadCart();

      // Check if product already exists in cart
      final existingIndex = currentCart.indexWhere(
            (item) => item.product.id == newItem.product.id,
      );

      if (existingIndex != -1) {
        // Update quantity if product exists
        currentCart[existingIndex] = currentCart[existingIndex].copyWith(
          quantity: currentCart[existingIndex].quantity + newItem.quantity,
        );
      } else {
        // Add new item if product doesn't exist
        currentCart.add(newItem);
      }

      return await saveCart(currentCart);
    } catch (e) {
      print('Error adding to cart: $e');
      return false;
    }
  }

  // FIXED: Now works with cart item ID instead of product ID
  Future<bool> removeFromCart(String cartItemId) async {
    try {
      print('Attempting to remove cart item with ID: $cartItemId');
      final currentCart = await loadCart();

      // Convert cartItemId to int for comparison
      final int itemId = int.parse(cartItemId);

      print('Current cart items: ${currentCart.map((item) => 'ID: ${item.id}, Product: ${item.product.name}').toList()}');

      final initialLength = currentCart.length;
      currentCart.removeWhere((item) => item.id == itemId);

      print('Items removed: ${initialLength - currentCart.length}');
      print('Remaining cart items: ${currentCart.map((item) => 'ID: ${item.id}, Product: ${item.product.name}').toList()}');

      return await saveCart(currentCart);
    } catch (e) {
      print('Error removing from cart: $e');
      return false;
    }
  }

  // FIXED: Now works with cart item ID instead of product ID
  Future<bool> updateCartItemQuantity(String cartItemId, int quantity) async {
    try {
      print('Attempting to update cart item ID: $cartItemId to quantity: $quantity');
      final currentCart = await loadCart();

      // Convert cartItemId to int for comparison
      final int itemId = int.parse(cartItemId);

      print('Current cart items: ${currentCart.map((item) => 'ID: ${item.id}, Product: ${item.product.name}, Qty: ${item.quantity}').toList()}');

      final itemIndex = currentCart.indexWhere(
            (item) => item.id == itemId,
      );

      print('Found item at index: $itemIndex');

      if (itemIndex != -1) {
        if (quantity <= 0) {
          // Remove item if quantity is 0 or negative
          print('Removing item due to zero quantity');
          currentCart.removeAt(itemIndex);
        } else {
          // Update quantity
          print('Updating quantity from ${currentCart[itemIndex].quantity} to $quantity');
          currentCart[itemIndex] = currentCart[itemIndex].copyWith(
            quantity: quantity,
          );
        }

        final result = await saveCart(currentCart);
        print('Save result: $result');
        return result;
      } else {
        print('Cart item not found with ID: $itemId');
        return false;
      }
    } catch (e) {
      print('Error updating cart quantity: $e');
      return false;
    }
  }

  Future<bool> clearCart() async {
    try {
      await init();
      return await _prefs?.remove(_cartKey) ?? false;
    } catch (e) {
      print('Error clearing cart: $e');
      return false;
    }
  }
}