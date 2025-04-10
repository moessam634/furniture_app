import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/home/model/data/home_data.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final HomeData homeData = HomeData();

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    try {
      final categories = await homeData.getCategories();
      emit(CategoriesSuccessState(data: categories));
    } catch (e) {
      emit(CategoriesErrorState(errorMessage: e.toString()));
    }
  }

  void selectCategory(int index) {
    if (state is CategoriesSuccessState) {
      final currentState = state as CategoriesSuccessState;
      emit(
        currentState.copyWith(selectedIndex: index),
      );
    }
  }
}
