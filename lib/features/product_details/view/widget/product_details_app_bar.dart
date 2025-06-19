import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/widgets/custom_favorite_icon.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key, this.onPressed, required this.icon});

  final void Function()? onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorsApp.kLightTextColor,
              ),
            ),
            CustomFavoriteIcon(
              width: 44.w,
              height:44.h,
              icon: icon,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
