import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'custom_border_text_field.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.fillColor,
    this.obscureText = false,
    this.prefixIcon,
    this.radius,
    this.focusNode,
    this.focusedFillColor,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final bool obscureText;
  final double? radius;
  final FocusNode? focusNode;
  final Color? focusedFillColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(
        () => _onFocusChange(),
      );
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(
      () => _onFocusChange(),
    );
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.black14,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        fillColor: _focusNode.hasFocus
            ? widget.focusedFillColor ?? ColorsApp.kSecondaryColor
            : widget.fillColor ?? ColorsApp.kBackGroundColor,
        filled: true,
        errorBorder: textFormFieldBorder(
            radius: widget.radius ?? 16.r, color: Colors.red),
        focusedErrorBorder: textFormFieldBorder(
            radius: widget.radius ?? 16.r, color: Colors.red),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: textFormFieldBorder(
            radius: widget.radius ?? 16.r, color: ColorsApp.kBackGroundColor),
        focusedBorder: textFormFieldBorder(
            radius: widget.radius ?? 16.r, color: ColorsApp.kSecondaryColor),
      ),
    );
  }
}
