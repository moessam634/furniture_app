import 'package:bloc/bloc.dart';
import '../../../../core/styles/constants.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());


  void getCategories() {
    emit(CategoriesLoadingState());
    try {
      final categories = MockData.getCategories();
      emit(CategoriesSuccessState(data: CategoriesResponse(categories)));
    } catch (e) {
      emit(CategoriesErrorState( errorMessage: 'Failed to load categories'));
    }
  }
}

