import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCategoryItem({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorsApp.kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: const Color(0xFF9AADAF), width: 1.w),
        ),
        child: Text(
          name,
          style: TextStyles.white16.copyWith(
              color: isSelected ? Colors.white : ColorsApp.kPrimaryColor),
        ),
      ),
    );
  }
}
