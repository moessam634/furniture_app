import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_rating_row.dart';
import 'package:furniture_app/features/product_details/view/widget/product_details_app_bar.dart';
import '../../../../core/widgets/custom_counter_container.dart';
import 'custom_circle_container.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: .47.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.kBackGroundColor,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomCircleContainer(),
                  SizedBox(
                    height: 4.h,
                  ),
                  Positioned(
                    bottom: 34.h,
                    child: Text(
                      "360°",
                      style: TextStyles.kPrimaryColor10.copyWith(
                          letterSpacing: .7, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text("Modern Chair",
                                    style: TextStyles.black24),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              CustomRatingRow(
                                rate: "(4.5)",
                                iconSize: 18.sp,
                                textStyle: TextStyles.kPrimaryColor10
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        Text("\$100", style: TextStyles.black24),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text("Details",
                        style: TextStyles.black16
                            .copyWith(color: ColorsApp.kDarkTextColor)),
                    SizedBox(height: 5.h),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt\nut labore et dolore magna aliqua.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.black14.copyWith(
                        color: ColorsApp.kLightTextColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageApp.rectangleImage),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "Add to Cart",
                      style: TextStyles.white18,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        ProductDetailsAppBar(
          onPressed: () {},
        ),
        Positioned(
          // top: 351.5.h,
          top: .434.sh,
          left: 0,
          right: 0,
          child: Center(
            child: CustomCounterContainer(
              text: '2',
              onPressedPlus: () {},
              onPressedMinus: () {},
            ),
          ),
        ),
      ],
    );
  }
}
