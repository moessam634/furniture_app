import 'package:bloc/bloc.dart';
import 'package:furniture_app/core/utils/local_storage_service.dart';
import '../../../core/styles/constants.dart';
import '../../home/model/home_model/product_model.dart';
import '../model/model/cart_item_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final LocalStorageService _cartService;

  CartCubit(this._cartService) : super(CartInitial());

  Future<void> getCartProducts() async {
    try {
      emit(CartLoading());
      final cartItems = await _cartService.loadCart();
      emit(CartSuccess(cartItems: cartItems));
    } catch (e) {
      print('Error loading cart: $e');
      emit(CartError(errorMessage: 'Failed to load cart'));
    }
  }

// Updated addToCart method to accept int instead of String
  Future<String> addToCart({required int productId, int quantity = 1}) async {
    try {
      final allProducts = MockData.getProducts();
      print('Total products available: ${allProducts.length}');

      ProductModel? product;

      // Simplified product finding since we're now using int directly
      try {
        product = allProducts.firstWhere((p) => p.id == productId);
        print('Found product: ${product.name}');
      } catch (e) {
        print('Product not found');
        print('Available product IDs: ${allProducts.map((p) => p.id).toList()}');
        print('Searching for: $productId');
        emit(CartError(errorMessage: 'Product not found'));
        return 'المنتج غير موجود';
      }

      final cartItem = CartItemModel(
        id: DateTime.now().millisecondsSinceEpoch,
        product: product,
        quantity: quantity,
      );

      print('Created cart item: ${cartItem.product.name}');

      final success = await _cartService.addToCart(cartItem);
      print('Add to cart result: $success');

      if (success) {
        await getCartProducts(); // Refresh cart data
        return 'تم إضافة المنتج إلى السلة';
      } else {
        emit(CartError(errorMessage: 'Failed to add to cart'));
        return 'فشل في إضافة المنتج';
      }
    } catch (e) {
      print('Error in addToCart: $e');
      print('Stack trace: ${StackTrace.current}');
      emit(CartError(errorMessage: 'Failed to add to cart: $e'));
      return 'فشل في إضافة المنتج: $e';
    }
  }

  // Fixed: Use cart item ID instead of product ID
  Future<void> deleteFromCart(int cartItemId) async {
    try {
      final success = await _cartService.removeFromCart(cartItemId.toString());
      if (success) {
        await getCartProducts(); // Refresh cart data
      } else {
        emit(CartError(errorMessage: 'Failed to remove from cart'));
      }
    } catch (e) {
      print('Error removing from cart: $e');
      emit(CartError(errorMessage: 'Failed to remove from cart'));
    }
  }

  // Fixed: Use cart item ID instead of product ID
  Future<void> updateCartQuantity(int cartItemId, int quantity) async {
    try {
      final success = await _cartService.updateCartItemQuantity(cartItemId.toString(), quantity);
      if (success) {
        await getCartProducts(); // Refresh cart data
      } else {
        emit(CartError(errorMessage: 'Failed to update quantity'));
      }
    } catch (e) {
      print('Error updating cart quantity: $e');
      emit(CartError(errorMessage: 'Failed to update quantity'));
    }
  }

  Future<void> clearCart() async {
    try {
      final success = await _cartService.clearCart();
      if (success) {
        await getCartProducts(); // Refresh cart data
      } else {
        emit(CartError(errorMessage: 'Failed to clear cart'));
      }
    } catch (e) {
      print('Error clearing cart: $e');
      emit(CartError(errorMessage: 'Failed to clear cart'));
    }
  }

  double getTotalPrice() {
    if (state is CartSuccess) {
      final cartItems = (state as CartSuccess).cartItems;
      return cartItems.fold(0.0, (total, item) => total + item.totalPrice);
    }
    return 0.0;
  }

  int getTotalItems() {
    if (state is CartSuccess) {
      final cartItems = (state as CartSuccess).cartItems;
      return cartItems.fold(0, (total, item) => total + item.quantity);
    }
    return 0;
  }
}