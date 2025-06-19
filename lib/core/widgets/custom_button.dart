import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.style,
      this.onTap,
      this.color,
      this.border,
      this.height,
      this.width});

  final String text;
  final TextStyle? style;
  final Color? color;
  final double? height, width;
  final BoxBorder? border;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: border ?? Border.all(color: ColorsApp.kPrimaryColor),
          color: color ?? ColorsApp.kPrimaryColor,
        ),
        child: SizedBox(
          height: height ?? 30.h,
          child: Text(
            text,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
