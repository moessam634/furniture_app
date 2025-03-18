import 'package:flutter/material.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/features/on_boarding/view/screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> delayingFunction() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        if (mounted) {
          NavigationHelper.pushUntil(
            context: context,
            destination: OnBoardingScreen(),
          );
        }
      },
    );
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
