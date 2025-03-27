sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final dynamic userData;
  final String message;

  RegisterSuccess({
    required this.userData,
    required this.message,
  });
}

final class RegisterError extends RegisterState {
  final String errorMessage;

  RegisterError({required this.errorMessage});
}
