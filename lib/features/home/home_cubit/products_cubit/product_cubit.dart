import 'package:bloc/bloc.dart';
import '../../model/data/home_data.dart';
import '../../model/home_model/product_model.dart';
import 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(this._homeProductData) : super(ProductLoadingState());
  final HomeData _homeProductData;
  List<ProductModel> allProducts = [];

  getProduct() async {
    try {
      var data = await _homeProductData.getProducts();
      allProducts = data;
      emit(ProductSuccessState(products: data));
    } catch (e) {
      emit(ProductFailureState(errorMessage: e.toString()));
    }
  }

  void filterByCategory(String categoryName) {
    final filtered = allProducts.where((product) {
      return product.categoryName?.trim() == categoryName.trim();
    }).toList();
    emit(ProductSuccessState(products: filtered));
  }

  void resetFilter() {
    emit(ProductSuccessState(products: allProducts));
  }
}
