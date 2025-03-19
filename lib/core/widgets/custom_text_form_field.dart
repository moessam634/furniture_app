import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'custom_border_text_field.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.fillColor,
    this.focusColor,
    this.obscureText = false,
    this.prefixIcon,
    this.radius,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color? focusColor;
  final bool obscureText;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.black14,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        focusColor: focusColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: textFormFieldBorder(
            radius: radius ?? 16.r, color: ColorsApp.kBackGroundColor),
        focusedBorder: textFormFieldBorder(
            radius: radius ?? 16.r, color: ColorsApp.kSecondaryColor),
      ),
    );
  }
}
