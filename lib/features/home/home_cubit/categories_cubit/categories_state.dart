import '../../model/home_model/categories_model.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoriesModel data;
  final int selectedIndex;

  CategoriesSuccessState({
    required this.data,
    this.selectedIndex = 0,
  });

  CategoriesSuccessState copyWith({
    CategoriesModel? data,
    int? selectedIndex,
  }) {
    return CategoriesSuccessState(
      data: data ?? this.data,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

final class CategoriesErrorState extends CategoriesState {
  final String errorMessage;

  CategoriesErrorState({required this.errorMessage});
}
