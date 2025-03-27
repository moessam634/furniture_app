sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final dynamic user;
  final String message;

  LoginSuccess({
    required this.user,
    required this.message,
  });
}

final class LoginError extends LoginState {}
