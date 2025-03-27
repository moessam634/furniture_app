import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/widgets/custom_rating_row.dart';
import 'package:furniture_app/features/product_details/view/screen/product_details_screen.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../core/widgets/custom_plus_icon.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.w,
      height: 204.h,
      child: InkWell(
        onTap: () {
          NavigationHelper.push(
              context: context, destination: ProductDetailsScreen());
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 127.w,
                  height: 124.h,
                  decoration: BoxDecoration(
                    color: ColorsApp.kBackGroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      image: AssetImage(
                        ImageApp.sofa,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: CustomFavoriteIcon(
                    icon: ImageApp.heartIcon,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              height: 80.h,
              decoration: BoxDecoration(
                color: ColorsApp.kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        StringApp.sofa,
                        style: TextStyles.black16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      CustomRatingRow()
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$100",
                        style: TextStyles.kPrimaryColor16,
                      ),
                      CustomPlusIcon(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
