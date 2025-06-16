import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/cart/model/model/cart_products_model.dart';
import '../model/data/cart_data.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartData) : super(CartInitial());

  final CartData cartData;

  Future<List<CartProductsModel>> getCartProducts() async {
    // emit(CartLoading());
    try {
      final cart = await cartData.getCartProducts();
      emit(CartSuccess(products: cart));
      return cart;
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
      rethrow;
    }
  }
  Future<String> addToCart({required int productId, int? quantity}) async {
    emit(CartLoading());
    try {
      final result = await cartData.addToCart(productId: productId, quantity: quantity);
      emit(AddToCartSuccess(message: result.message));
      return result.message;
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
      return 'حدث خطأ أثناء إضافة المنتج';
    }
  }

  Future<String> deleteFromCart({required int cartId}) async {
    emit(CartLoading());
    var success = await cartData.deleteFromCart(cartId: cartId);
    final message = success.message;
    emit(AddToCartSuccess(message: message));
    getCartProducts();
    return message;
  }

  Future<String> updateCartQuantity(
      {required int productId, required int quantity}) async {
    try {
      await cartData.updateCartQuantity(cartId: productId, quantity: quantity);
      final updatedProducts = await getCartProducts();
      emit(CartSuccess(products: updatedProducts));
      await getCartProducts();
      return "Added to cart successfully";
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
      return "Failed to add to cart: ${e.toString()}";
    }
  }
}
