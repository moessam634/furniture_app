
import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/check_out/cubit/pay_mob__state.dart';

import '../../../core/utils/pay_mob_service.dart';

class PayMobCubit extends Cubit<PayMobState> {
  PayMobCubit(this.paymobManager) : super(PayMobInitial());

  final PaymobManager paymobManager;
  Future<String> getPaymentKey( double amount, String currency) async {
    emit(PayMobLoading());
    try {
      final paymentKey = await paymobManager.getPaymentKey(amount, currency);
      emit(PayMobSuccess());
      return paymentKey;
    } catch (e) {
      emit(PayMobFailure(errorMessage: e.toString()));
      rethrow;
    }
  }

}
