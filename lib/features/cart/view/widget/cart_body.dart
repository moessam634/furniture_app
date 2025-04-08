import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_counter_container.dart';
import 'package:furniture_app/core/widgets/custom_horizontal_product.dart';
import 'package:furniture_app/features/cart/view/widget/custom_total_price.dart';
import '../../../../core/styles/text_styles.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final ScrollController scrollController = ScrollController();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isVisible) setState(() => isVisible = false);
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isVisible) setState(() => isVisible = true);
    }

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isVisible) setState(() => isVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView.separated(
            controller: scrollController,
            itemCount: 10,
            padding: EdgeInsets.only(bottom: 295.h),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomHorizontalProduct(
                    title: 'Sofa-bed',
                    price: '\$100',
                    image: 'assets/images/sofa.png',
                    rate: "4.5",
                    addProductIcon: CustomCounterContainer(
                      width: 56.w,
                      height: 28.h,
                      side: BorderSide.none,
                      style: TextStyles.white16.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      iconSize: 12.sp,
                      text: "2",
                      onPressedPlus: () {},
                      onPressedMinus: () {},
                    ),
                  ),
                ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 360),
            curve: Curves.easeInOut,
            bottom: isVisible ? 80.h : -190.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                children: [
                  CustomTotalPrice(totalPrice: "200", totalItems: "2 "),
                  SizedBox(height: 25.h),
                  CustomButton(
                    text: "Check out",
                    style: TextStyles.white18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
