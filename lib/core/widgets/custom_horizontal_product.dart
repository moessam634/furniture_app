import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:furniture_app/core/widgets/custom_network_image.dart';
import '../styles/colors_app.dart';
import '../styles/image_app.dart';
import '../styles/text_styles.dart';
import 'custom_favorite_icon.dart';
import 'custom_rating_row.dart';

class CustomHorizontalProduct extends StatelessWidget {
  const CustomHorizontalProduct({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
    required this.addProductIcon,
    required this.isFavorite,
    this.onPressed,
    this.onTap,
    this.onIconPressed,
  });

  final String image, title, price, rate;
  final Widget addProductIcon;
  final void Function(BuildContext)? onPressed;
  final void Function()? onTap;
  final void Function()? onIconPressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: .4.sw,
                height: 120.h,
                decoration: BoxDecoration(
                  color: ColorsApp.kBackGroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                  // image: DecorationImage(
                  //   alignment: Alignment.center,
                  //   fit: BoxFit.contain,
                  //   image: NetworkImage(image),
                  // ),
                ),
                child: CustomNetworkImage(image: image),
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: CustomFavoriteIcon(
                  height: 30.sp,
                  icon: isFavorite ? ImageApp.filledHeart : ImageApp.heartIcon,
                  onPressed: onIconPressed,
                ),
              ),
            ],
          ),
          Expanded(
            child: Slidable(
              endActionPane: ActionPane(
                extentRatio: .20,
                motion: const ScrollMotion(),
                children: [
                  CustomSlidableAction(
                    onPressed: onPressed,
                    backgroundColor: ColorsApp.kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              child: Container(
                height: 120.h,
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 16.w,
                  top: 24.h,
                ),
                decoration: BoxDecoration(
                  color: ColorsApp.kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title,
                            style: TextStyles.black16,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(width: 9.w),
                        CustomRatingRow(rate: rate),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            price,
                            style: TextStyles.kPrimaryColor16,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Spacer(),
                        Expanded(child: addProductIcon),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
