import 'package:flutter/material.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText(
      {super.key,
      required this.text,
       this.textButton,
      this.textStyle,
      this.textButtonStyle,
      this.onPressed});

  final String? text, textButton;
  final TextStyle? textStyle, textButtonStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text??StringApp.categories,
          style: textStyle ?? TextStyles.black22,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton??"",
            style: textButtonStyle ?? TextStyles.kPrimaryColor16,
          ),
        ),
      ],
    );
  }
}
