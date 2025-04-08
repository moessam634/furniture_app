import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
    this.onTap,
    this.icon,
  });

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: ShapeDecoration(
          color: ColorsApp.kBackGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.search,
                  size: 20,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "search",
                  style: TextStyles.black16.copyWith(
                    color: ColorsApp.kLightTextColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.mic,
                  color: ColorsApp.kPrimaryColor,
                  size: 20,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  icon,
                  size: 20,
                  color: ColorsApp.kPrimaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
