import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/switcher/cubit/switcher_state.dart';

class SwitcherCubit extends Cubit<SwitcherState> {
  SwitcherCubit() : super(SwitcherInitial());
  int currentIndex = 0;

  void changeScreen(value) {
    currentIndex = value;
    emit(SwitcherUpdate());
  }
}
