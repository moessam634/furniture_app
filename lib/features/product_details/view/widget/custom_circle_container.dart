import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../core/styles/image_app.dart';
import 'image_preview.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 215.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.elliptical(215.w / 2, 80.h / 2),
            ),
            border: GradientBoxBorder(
              width: 1.5.w,
              gradient: LinearGradient(
                colors: [
                  ColorsApp.kPrimaryColor,
                  const Color(0xffe4e7e8),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Container(
          width: 30.w,
          height: 15.h,
          alignment: Alignment.bottomCenter,
          decoration: ShapeDecoration(
            color: ColorsApp.kBackGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ImageApp.arrowBackIcon,
                width: 3.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              SvgPicture.asset(
                ImageApp.arrowForwardIcon,
                width: 3.w,
              ),
            ],
          ),
        ),
        ProductView360(
          imageUrls: [
            // ImageApp.chair,
            ImageApp.first,
            ImageApp.second,
            ImageApp.third,
            ImageApp.fourth,
            ImageApp.fifth,
          ],
        ),
      ],
    );
  }
}
