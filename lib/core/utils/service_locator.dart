import 'package:dio/dio.dart';
import 'package:furniture_app/core/utils/pay_mob_service.dart';
import 'package:furniture_app/core/utils/storage_helper.dart';
import 'package:furniture_app/features/auth/login/cubit/login_cubit.dart';
import 'package:furniture_app/features/auth/login/model/data/login_data.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/cart/cubit/cart_cubit.dart';
import '../../features/cart/cubit/pay_mob_cubit/pay_mob__cubit.dart';
import '../../features/home/home_cubit/categories_cubit/categories_cubit.dart';
import '../../features/home/home_cubit/products_cubit/product_cubit.dart';
import 'local_storage_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() async{
  final dio = Dio();
  sl.registerSingleton(dio);

  await LocalStorageService.init();

  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageService());

  sl.registerLazySingleton(() => LoginData(sl()));
  sl.registerLazySingleton(() => StorageHelper());
  // sl.registerLazySingleton(() => HomeData(sl()));
  // sl.registerLazySingleton(() => CartData(sl()));
  sl.registerLazySingleton(() => PaymobManager(sl()));

  sl.registerFactory(() => LoginCubit(sl<LoginData>()));
  sl.registerFactory(() => CategoriesCubit());
  sl.registerFactory(() => ProductsCubit());
  sl.registerFactory(() => CartCubit(sl<LocalStorageService>()));
  sl.registerFactory(() => PayMobCubit(sl<PaymobManager>()));
}
