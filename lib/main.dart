import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'my_app.dart';

void main() {
  // runApp(const MyApp());

  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}
