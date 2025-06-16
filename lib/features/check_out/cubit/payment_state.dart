sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentError extends PaymentState {
  final String errorMessage;

  PaymentError({required this.errorMessage});
}
