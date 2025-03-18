import 'package:flutter/material.dart';
import '../../../../core/styles/text_styles.dart';

class GlobalHeader extends StatelessWidget {
  const GlobalHeader(
      {super.key,
      this.icon,
      this.iconOnTap,
      required this.text,
      this.style,
      this.textOnTap});

  final IconData? icon;
  final void Function()? iconOnTap;
  final String text;
  final void Function()? textOnTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        icon != null
            ? InkWell(
                onTap: iconOnTap,
                child: Icon(icon),
              )
            : SizedBox(
                width: 24,
              ),
        InkWell(
          onTap: textOnTap,
          child: Text(
            text,
            style: style ?? TextStyles.kPrimaryColor18,
          ),
        ),
      ],
    );
  }
}
