import 'package:dio/dio.dart';
import 'package:furniture_app/core/utils/pay_mob_service.dart';
import 'package:furniture_app/core/utils/storage_helper.dart';
import 'package:furniture_app/core/utils/stripe_service.dart';
import 'package:furniture_app/features/auth/login/cubit/login_cubit.dart';
import 'package:furniture_app/features/auth/login/model/data/login_data.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/cart/model/data/cart_data.dart';
import 'package:furniture_app/features/check_out/cubit/pay_mob__cubit.dart';
import 'package:furniture_app/features/check_out/cubit/payment_cubit.dart';
import 'package:furniture_app/features/check_out/model/data/payment_data.dart';
import 'package:furniture_app/features/home/home_cubit/categories_cubit/categories_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_cubit.dart';
import 'package:furniture_app/features/home/model/data/home_data.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() async{
  final dio = Dio();
  sl.registerSingleton(dio);

  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerSingleton(LocalStorageService(sharedPrefs));

  sl.registerLazySingleton(() => LoginData(sl()));
  sl.registerLazySingleton(() => StorageHelper());
  sl.registerLazySingleton(() => HomeData(sl()));
  sl.registerLazySingleton(() => CartData(sl()));
  sl.registerLazySingleton(() => StripeService(sl()));
  sl.registerLazySingleton(() => PaymentData(sl()));
  sl.registerLazySingleton(() => PaymobManager(sl()));

  sl.registerFactory(() => LoginCubit(sl<LoginData>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeData>()));
  sl.registerFactory(() => ProductsCubit(sl<HomeData>()));
  sl.registerFactory(() => CartCubit(sl<CartData>()));
  sl.registerFactory(() => PaymentCubit(sl<PaymentData>()));
  sl.registerFactory(() => PayMobCubit(sl<PaymobManager>()));
}
