import '../../model/home_model/product_model.dart';

sealed class ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final List<ProductModel> products;

  ProductSuccessState({required this.products});
}

final class ProductFailureState extends ProductState {
  final String errorMessage;

  ProductFailureState({required this.errorMessage});
}
