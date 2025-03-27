import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/sign_up/cubit/register_state.dart';
import 'package:furniture_app/features/sign_up/model/data/register_data.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final RegisterData registerData = RegisterData();

  void registerCubit(
      {required name, required emailOrPhone, required password}) async {
    emit(RegisterLoading());
    var success = await registerData.registerData(
        name: name, email: emailOrPhone, password: password);
    final message = success['message'];
    emit(RegisterSuccess(userData: success, message: message));
  }
}
