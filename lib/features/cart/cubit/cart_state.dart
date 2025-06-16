import '../model/model/cart_products_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class AddToCartSuccess extends CartState {
  final String message;

  AddToCartSuccess({required this.message});
}

final class CartSuccess extends CartState {
  List<CartProductsModel> products;

  CartSuccess({required this.products});
}

final class CartError extends CartState {
  final String errorMessage;

  CartError({required this.errorMessage});
}
