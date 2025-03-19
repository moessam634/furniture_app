import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';

class CustomOffersContainer extends StatelessWidget {
  const CustomOffersContainer(
      {super.key,
      required this.discountImage,
      required this.productImage,
      this.onTap});

  final String discountImage, productImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * (327 / 375);
        double containerHeight = containerWidth * (176 / 327);
        return InkWell(
          onTap: onTap,
          child: Container(
            width: containerWidth,
            decoration: ShapeDecoration(
              color: ColorsApp.kBackGroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                ),
                Image.asset(
                  discountImage,
                  width: containerWidth * .217,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Image.asset(
                  productImage,
                  height: containerHeight * .733,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
