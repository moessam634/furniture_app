import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/widgets/custom_counter_container.dart';
import 'package:furniture_app/features/cart/view/screen/cart_screen.dart';
import 'package:furniture_app/features/home/view/screen/home_screen.dart';
import 'package:furniture_app/features/product_details/view/screen/product_details_screen.dart';
import 'package:furniture_app/features/splash/view/screen/splash_screen.dart';
import 'package:furniture_app/features/switcher/view/screen/switcher_screen.dart';
import 'features/product_details/view/widget/custom_circle_container.dart';
import 'features/product_details/view/widget/image_preview.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: SwitcherScreen(),
    );
  }
}
