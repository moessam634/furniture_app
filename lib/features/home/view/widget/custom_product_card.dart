import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/widgets/custom_network_image.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../core/widgets/custom_plus_icon.dart';
import '../../../favorite/cubit/favorite_cubit.dart';

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
    return SizedBox(
      width: 127.w,
      height: 204.h,
      child: InkWell(
        onTap: onTap,
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
                  ),
                  child: CustomNetworkImage(image: image),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: CustomFavoriteIcon(
                    icon: isFavorite?ImageApp.filledHeart:ImageApp.heartIcon,
                    onPressed: onIconPressed,
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
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyles.black16,
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
                            price,
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
    );
  }
}
