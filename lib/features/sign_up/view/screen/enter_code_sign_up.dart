import 'package:flutter/material.dart';
import 'package:furniture_app/features/forget_password/view/widget/enter_code_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class EnterCodeSignUpScreen extends StatelessWidget {
  const EnterCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: EnterCodeSignUpBody(),
    );
  }
}
