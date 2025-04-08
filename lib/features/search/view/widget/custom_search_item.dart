import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: ShapeDecoration(
            color: ColorsApp.kBackGroundColor,
            shape: CircleBorder(),
          ),
          child: Center(
            child: Container(
              width: 46.w,
              height: 38.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text,
          style: TextStyles.black16,
        )
      ],
    );
  }
}
