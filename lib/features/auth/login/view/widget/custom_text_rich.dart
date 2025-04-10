import 'package:flutter/material.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

import '../../../../../core/helper/tap_gestures.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text1,
    required this.text2,
    this.style1,
    this.style2,
    required this.navigateTo,
  });

  final String text1, text2;
  final TextStyle? style1, style2;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: style1 ?? TextStyles.black16,
          ),
          TextSpan(
            text: text2,
            style: style2 ?? TextStyles.kPrimaryColor18,
            recognizer: TapGestureHelper.navigateToScreen(
                context: context, screen: navigateTo),
          ),
        ],
      ),
    );
  }
}
