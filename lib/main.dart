import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:furniture_app/core/utils/api_keys.dart';
import 'package:furniture_app/core/utils/service_locator.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'features/favorite/cubit/favorite_cubit.dart';
import 'my_app.dart';

void main() {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
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
