import 'package:bloc/bloc.dart';
import '../model/data/login_data.dart';
import '../model/login_model/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginData loginData = LoginData();

  void login({required String name, required String password}) async {
    emit(LoginLoading());
    try {
      final LoginModel response =
          await loginData.login(name: name, password: password);
      if (response.status == "success") {
        emit(LoginSuccess(response));
      } else {
        emit(LoginError(errorMessage: response.message ?? "Login failed"));
      }
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
