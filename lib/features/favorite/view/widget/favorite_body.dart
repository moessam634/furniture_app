import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_plus_icon.dart';
import '../../../../core/widgets/custom_horizontal_product.dart';
import '../../../../core/widgets/custom_search_container.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  // ScrollController scrollController = ScrollController();
  // bool isVisible = true;
  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(listener);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            CustomSearchContainer(
              onTap: () {},
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemBuilder: (context, index) => CustomHorizontalProduct(
                  title: 'Sofa-bed',
                  price: '\$100',
                  image: 'assets/images/sofa.png',
                  rate: "4.5",
                  addProductIcon: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: CustomPlusIcon(),
                  ),
                ),
              ),
            ),
            // Spacer(),
            CustomButton(
              text: "Add all item to cart",
              style: TextStyles.white18,
            )
          ],
        ),
      ),
    );
  }
}
