import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';

class CustomFavoriteIcon extends StatelessWidget {
  final void Function()? onPressed;
  final String icon;
  final double? width, height;

  const CustomFavoriteIcon(
      {super.key, this.onPressed, required this.icon, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 35,
      height: height ?? 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: .2.r,
            blurRadius: 5.r,
          ),
        ],
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
            width: width ?? 35,
            height: height ?? 35,
            colorFilter:
                ColorFilter.mode(ColorsApp.kPrimaryColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
