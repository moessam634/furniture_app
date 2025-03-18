import 'package:flutter/material.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import 'package:furniture_app/features/forget_password/view/widget/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context: context),
      body: ResetPasswordBody(),
    );
  }
}
