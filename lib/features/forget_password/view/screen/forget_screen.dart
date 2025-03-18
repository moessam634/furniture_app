import 'package:flutter/material.dart';
import 'package:furniture_app/features/forget_password/view/widget/forget_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: ForgetBody(),
    );
  }
}
