import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/text_styles.dart';

class CustomRowItem extends StatelessWidget {
  const CustomRowItem(
      {super.key,
      required this.leadingIcon,
      required this.text,
      this.textStyle,
      this.onPressed,
      this.trailingIcon,
      this.iconButton});

  final IconData leadingIcon;
  final IconData? trailingIcon;
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final Widget? iconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Icon(leadingIcon),
            Text(
              text,
              style: textStyle ??
                  TextStyles.black18.copyWith(
                      fontWeight: FontWeight.w400, letterSpacing: 1.26),
            ),
          ],
        ),
        iconButton ?? IconButton(onPressed: onPressed, icon: Icon(trailingIcon))
      ],
    );
  }
}
