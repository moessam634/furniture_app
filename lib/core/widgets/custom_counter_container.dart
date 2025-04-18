import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

class CustomCounterContainer extends StatelessWidget {
  const CustomCounterContainer({
    super.key,
    this.side,
    this.width,
    this.height,
    required this.text,
    required this.onPressedPlus,
    required this.onPressedMinus,
    this.style,
    this.iconSize,
  });

  final BorderSide? side;
  final double? width, height;
  final String text;
  final TextStyle? style;
  final double? iconSize;

  final void Function() onPressedPlus, onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150.w,
      height: height ?? 55.h,
      decoration: ShapeDecoration(
        color: ColorsApp.kLightPrimaryColor,
        shape: RoundedRectangleBorder(
          side: side ??
              BorderSide(
                width: 5,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white,
              ),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: onPressedPlus,
            child: Container(
              decoration: ShapeDecoration(
                color: ColorsApp.kBackGroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Icon(
                Icons.add,
                color: ColorsApp.kPrimaryColor,
                size: iconSize,
              ),
            ),
          ),
          Text(
            text,
            style: style ?? TextStyles.white24,
          ),
          InkWell(
            onTap: onPressedMinus,
            child: Container(
              decoration: ShapeDecoration(
                color: ColorsApp.kBackGroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Icon(
                Icons.remove,
                color: ColorsApp.kPrimaryColor,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
