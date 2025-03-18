import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons(
      {super.key,
      this.onPressed,
      required this.icon1,
      required this.icon2,
      required this.icon3});

  final void Function()? onPressed;
  final String icon1;
  final String icon2;
  final String icon3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon1,
            colorFilter:
                ColorFilter.mode(ColorsApp.kPrimaryColor, BlendMode.color),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon2,
            colorFilter:
                ColorFilter.mode(ColorsApp.kPrimaryColor, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon3,
            colorFilter:
                ColorFilter.mode(ColorsApp.kPrimaryColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
