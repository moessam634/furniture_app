import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_state.dart';
import 'package:furniture_app/features/home/model/data/home_data.dart';
import '../../model/home_model/categories_model.dart';
import '../../model/home_model/product_model.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeData) : super(CategoriesInitial());
  final HomeData _homeData;

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    try {
      final allCategories = await _homeData.getCategories();
      final allCategory = Categories(id: -1, name: "الكل");
      final categoriesWithAll = [allCategory, ...allCategories.categories];
      emit(CategoriesSuccessState(
          data: CategoriesModel(
              status: allCategories.status, categories: categoriesWithAll)));
    } catch (e) {
      emit(CategoriesErrorState(errorMessage: e.toString()));
    }
  }
}
