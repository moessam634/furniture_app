import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/login/model/data/login_data.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginData loginData = LoginData();

  loginCubit({required name, required password}) async {
    emit(LoginLoading());
    var success = await loginData.loginData(name: name, password: password);
    final message = success["message"];
    emit(LoginSuccess(user: success, message: message));
  }
}
