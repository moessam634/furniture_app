import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/core/utils/service_locator.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'core/utils/local_storage_service.dart';
import 'features/favorite/cubit/favorite_cubit.dart';
import 'my_app.dart';

void main() async{
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
  await LocalStorageService.init();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FavoriteCubit()..loadFavorites()),
        BlocProvider(create: (_) => CartCubit(sl())..getCartProducts()),
      ],
      child: MyApp(),
    ),
  ));
}
