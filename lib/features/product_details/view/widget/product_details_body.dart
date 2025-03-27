import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_favorite_icon.dart';
import 'package:furniture_app/core/widgets/custom_rating_row.dart';
import '../../../../core/widgets/custom_counter_container.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 379.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.kBackGroundColor,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      ImageApp.chair,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.pop(context),
                      ),
                      actions: [
                        CustomFavoriteIcon(icon: ImageApp.heartIcon),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImageApp.arrowBackIcon,
                          width: 5.w,
                        ),
                        Text("360°",
                            style: TextStyles.kPrimaryColor10.copyWith(
                                letterSpacing: .7,
                                fontWeight: FontWeight.w500)),
                        SvgPicture.asset(
                          ImageApp.arrowForwardIcon,
                          width: 5.w,
                        ),
                      ],
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
                          Row(
                            children: [
                              Text("Modern Chair", style: TextStyles.black24),
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
                        style: TextStyles.black14
                            .copyWith(color: ColorsApp.kLightTextColor),
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
                      SizedBox(height: 15.h),
                      Spacer(),
                      CustomButton(
                        text: "Add to Cart",
                        style: TextStyles.white18,
                      ),
                      // SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 351.5.h,
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
      ),
    );
  }
}
