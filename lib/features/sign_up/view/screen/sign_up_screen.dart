import 'package:flutter/material.dart';
import 'package:furniture_app/features/sign_up/view/widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignUpBody(),
    );
  }
}
