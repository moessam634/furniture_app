import 'package:flutter/material.dart';
import '../../../../core/styles/text_styles.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText(
      {super.key,
      required this.text,
      required this.textButton,
      this.textStyle,
      this.textButtonStyle,
      this.onPressed});

  final String text, textButton;
  final TextStyle? textStyle, textButtonStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle ?? TextStyles.black22,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: textButtonStyle ?? TextStyles.kPrimaryColor16,
          ),
        ),
      ],
    );
  }
}
