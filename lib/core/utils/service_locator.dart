import 'package:dio/dio.dart';
import 'package:furniture_app/core/utils/storage_helper.dart';
import 'package:furniture_app/features/auth/login/cubit/login_cubit.dart';
import 'package:furniture_app/features/auth/login/model/data/login_data.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/cart/model/data/cart_data.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/home_cubit.dart';
import 'package:furniture_app/features/home/model/data/home_data.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  final dio = Dio();
  sl.registerLazySingleton(
    () => dio,
  );
  sl.registerLazySingleton(
    () => LoginData(dio: sl()),
  );
  sl.registerFactory(
    () => LoginCubit(sl()),
  );
  sl.registerLazySingleton(
    () => StorageHelper(),
  );
  sl.registerLazySingleton(
    () => HomeData(dio: sl()),
  );
  sl.registerLazySingleton(
    () => ProductsCubit(sl()),
  );
  sl.registerLazySingleton(
    () => CartData(dio: sl()),
  );
  sl.registerLazySingleton(
    () => CartCubit(sl()),
  );
}
