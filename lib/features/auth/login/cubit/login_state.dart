import '../model/login_model/login_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess(this.loginModel);
}

final class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});
}
