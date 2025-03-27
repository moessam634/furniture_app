import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/colors_app.dart';
import '../styles/image_app.dart';

class CustomPlusIcon extends StatelessWidget {
  const CustomPlusIcon({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: ColorsApp.kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            ImageApp.plusIcon,
          ),
        ),
      ),
    );
  }
}
