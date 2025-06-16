import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/check_out/cubit/payment_state.dart';
import 'package:furniture_app/features/check_out/model/data/payment_data.dart';
import '../model/models/payment_intent_input_model.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentData) : super(PaymentInitial());
  final PaymentData paymentData;

  makePayment({required PaymentIntentInputModel paymentInputModel}) async {
    emit(PaymentLoading());
    try {
      await paymentData.makePayment(paymentInputModel: paymentInputModel);
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentError(errorMessage: e.toString()));
    }
  }
}
