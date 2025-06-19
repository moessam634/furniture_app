import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/widgets/custom_network_image.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../core/widgets/custom_plus_icon.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.onTap,
    required this.onPressed,
    required this.onIconPressed,
    required this.isFavorite,
  });

  final String image, title;
  final String price;
  final void Function() onTap;
  final void Function() onPressed;
  final void Function() onIconPressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorsApp.kPrimaryColor.withOpacity(0.3),
          blurRadius: 10.r,
          spreadRadius: 0,
          offset: const Offset(0, 2),
        ),
      ]),
      child: SizedBox(
        width: 127.w,
        height: 204.h,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: SizedBox(
                        width: double.infinity,
                        height: 124.h,
                        child: CustomNetworkImage(image: image)),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: CustomFavoriteIcon(
                      icon:
                          isFavorite ? ImageApp.filledHeart : ImageApp.heartIcon,
                      onPressed: onIconPressed,
                      width: 33.w,
                      height: 35.h,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyles.black16,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "رس${double.parse(price).toStringAsFixed(1)}",
                              style: TextStyles.kPrimaryColor16,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          CustomPlusIcon(onTap: onPressed),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
