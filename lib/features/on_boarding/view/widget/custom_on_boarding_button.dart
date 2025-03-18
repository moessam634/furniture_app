import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({super.key, this.text = StringApp.next});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      height: 55.h,
      decoration: ShapeDecoration(
        color: ColorsApp.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyles.white18,
          ),
          SizedBox(
            width: 8.w,
          ),
          Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
