import 'package:flutter/material.dart';
import 'package:furniture_app/features/register/view/widget/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterBody(),
    );
  }
}
