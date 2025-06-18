import 'package:bloc/bloc.dart';
import '../../../../core/styles/constants.dart';
import '../../model/home_model/product_model.dart';
import 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit() : super(ProductLoadingState());

  List<ProductModel> _allProducts = [];
  String _currentCategoryFilter = '';

  void getProducts() {
    emit(ProductLoadingState());
    try {
      _allProducts = MockData.getProducts();
      emit(ProductSuccessState(products: _allProducts));
    } catch (e) {
      emit(ProductFailureState(errorMessage: 'Failed to load products'));
    }
  }

  void filterByCategory(String categoryName) {
    _currentCategoryFilter = categoryName;

    // Handle "All" category case
    if (categoryName == 'الكل' || categoryName == 'All') {
      emit(ProductSuccessState(products: _allProducts));
      return;
    }

    try {
      final categories = MockData.getCategories();

      // Find the category by name
      final category = categories.firstWhere(
            (cat) => cat.name.trim() == categoryName.trim(),
        orElse: () => throw Exception('Category not found'),
      );

      // Filter products by category ID
      final filteredProducts = _allProducts
          .where((product) => product.categoryId == category.id)
          .toList();

      // Debug print to help troubleshoot
      print('Filtering by category: $categoryName (ID: ${category.id})');
      print('Found ${filteredProducts.length} products in this category');

      emit(ProductSuccessState(products: filteredProducts));
    } catch (e) {
      print('Error filtering by category: $e');
      // If category not found, show all products
      emit(ProductSuccessState(products: _allProducts));
    }
  }

  void resetFilter() {
    _currentCategoryFilter = '';
    emit(ProductSuccessState(products: _allProducts));
  }

  // Helper method to get current filter
  String get currentFilter => _currentCategoryFilter;

  // Helper method to check if products are loaded
  bool get hasProducts => _allProducts.isNotEmpty;
}