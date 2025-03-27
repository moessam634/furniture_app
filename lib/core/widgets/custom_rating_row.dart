import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class CustomRatingRow extends StatelessWidget {
  const CustomRatingRow({super.key, this.iconSize, this.rate, this.textStyle});

  final double? iconSize;
  final String? rate;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: ColorsApp.kPrimaryColor,
          size: iconSize ?? 12.sp,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          rate ?? "(4.5)",
          style: textStyle ?? TextStyles.kPrimaryColor10,
        ),
      ],
    );
  }
}
