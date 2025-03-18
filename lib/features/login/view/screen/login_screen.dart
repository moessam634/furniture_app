import 'package:flutter/material.dart';
import 'package:furniture_app/features/login/view/widget/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginBody(),
    );
  }
}
