import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/auth/register/cubit/register_state.dart';
import '../model/data/register_data.dart';
import '../model/register_model/register_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final RegisterData registerData = RegisterData();

  void registerCubit({
    required name,
    required emailOrPhone,
    required password,
    required phone,
    required address,
  }) async {
    emit(RegisterLoading());
    final RegisterResponse response = await registerData.register(
      name: name,
      email: emailOrPhone,
      password: password,
      phone: phone,
      address: address,
    );

    if (response.status == 'success') {
      emit(RegisterSuccess(
        message: response.message ?? "تم التسجيل بنجاح",
      ));
    } else {
      final errorMsg = response.errors?.values.first ??
          response.message ??
          "حدث خطأ غير متوقع.";
      emit(RegisterError(errorMessage: errorMsg.toString()));
    }
  }
}
