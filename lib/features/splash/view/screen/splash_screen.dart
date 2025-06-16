import 'package:flutter/material.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/utils/storage_helper.dart';
import 'package:furniture_app/features/on_boarding/view/screen/on_boarding_screen.dart';
import 'package:furniture_app/features/switcher/view/screen/switcher_screen.dart';
import '../../../../core/utils/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> delayingFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final token = await sl<StorageHelper>().getToken();
    // final userId = await sl<StorageHelper>().getUserId();
    if (mounted) {
      if (token != null && token.isNotEmpty ) {
        NavigationHelper.pushUntil(
          context: context,
          destination: SwitcherScreen(),
        );
      } else {
        NavigationHelper.pushUntil(
          context: context,
          destination: OnBoardingScreen(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    delayingFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(ImageApp.splash),
      ),
    );
  }
}
