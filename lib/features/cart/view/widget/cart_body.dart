import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_counter_container.dart';
import 'package:furniture_app/core/widgets/custom_horizontal_product.dart';
import 'package:furniture_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_state.dart';
import 'package:furniture_app/features/cart/view/widget/custom_total_price.dart';
import 'package:furniture_app/features/product_details/view/screen/product_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../favorite/cubit/favorite_cubit.dart';
import '../../cubit/cart_cubit.dart';
import '../../cubit/pay_mob_cubit/pay_mob__cubit.dart';
import '../../cubit/pay_mob_cubit/pay_mob__state.dart';

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
    context.read<CartCubit>().getCartProducts();
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
          BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if (state is CartSuccess) {
              if (state.cartItems.isEmpty) {
                return Center(
                  child: Text(
                    "لا يوجد منتجات في السلة",
                    style: TextStyles.kPrimaryColor18,
                  ),
                );
              } else {
                return ListView.separated(
                  controller: scrollController,
                  itemCount: state.cartItems.length,
                  padding: EdgeInsets.only(bottom: 295.h),
                  separatorBuilder: (context, index) => SizedBox(height: 14.h),
                  itemBuilder: (context, index) {
                    final cartItem = state.cartItems[index];
                    final isFav = context
                        .read<FavoriteCubit>()
                        .isFavorite(cartItem.product.id);
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomHorizontalProduct(
                        isFavorite: isFav,
                        onTap: () {
                          NavigationHelper.push(
                              context: context,
                              destination: ProductDetailsScreen(
                                  productModel: cartItem.product));
                        },
                        onIconPressed: () {
                          context
                              .read<FavoriteCubit>()
                              .toggleFavorite(cartItem.product);
                          setState(() {});
                        },
                        title: cartItem.product.name,
                        price: double.parse(cartItem.product.price).toString(),
                        image: cartItem.product.images.first,
                        rate: "4.5",
                        onPressed: (_) {
                          context.read<CartCubit>().deleteFromCart(cartItem.id);
                        },
                        addProductIcon: CustomCounterContainer(
                          width: 56.w,
                          height: 28.h,
                          side: BorderSide.none,
                          style: TextStyles.white16.copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                          iconSize: 12.sp,
                          text: cartItem.quantity.toString(),
                          onPressedPlus: () {
                            context.read<CartCubit>().updateCartQuantity(
                                cartItem.id, cartItem.quantity + 1);
                          },
                          onPressedMinus: () {
                            if (cartItem.quantity > 1) {
                              context.read<CartCubit>().updateCartQuantity(
                                  cartItem.id, cartItem.quantity - 1);
                            } else {
                              context
                                  .read<CartCubit>()
                                  .deleteFromCart(cartItem.id);
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            } else if (state is CartLoading) {
              return Center(
                child: SpinKitFadingCircle(color: ColorsApp.kPrimaryColor),
              );
            } else if (state is CartError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyles.kPrimaryColor18,
                ),
              );
            } else {
              return Center(
                child: SpinKitFadingCircle(color: ColorsApp.kPrimaryColor),
              );
            }
          }),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess && state.cartItems.isNotEmpty) {
                double totalPrice = state.cartItems.fold(
                    0,
                        (sum, product) =>
                    sum +
                        (double.parse(product.product.price) *
                            product.quantity));
                int totalItems = state.cartItems
                    .fold(0, (sum, product) => sum + (product.quantity));

                return AnimatedPositioned(
                  duration: Duration(milliseconds: 360),
                  curve: Curves.easeInOut,
                  bottom: isVisible ? 80.h : -190.h,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        CustomTotalPrice(
                            totalPrice: totalPrice.toString(),
                            totalItems: totalItems.toString()),
                        SizedBox(height: 25.h),
                        BlocConsumer<PayMobCubit, PayMobState>(
                          listener: (context, state) {
                            if (state is PayMobSuccess) {
                              // NavigationHelper.pushUntil(
                              //     context: context,
                              //     destination: const CongratulationScreen());
                              // customSnackBar(context: context, text:state.message );
                            }
                            if (state is PayMobFailure) {
                              customSnackBar(
                                  context: context, text: state.errorMessage);
                            }
                          },
                          builder: (BuildContext context, PayMobState state) {
                            return CustomButton(
                                text: "Check out",
                                style: TextStyles.white18,
                                onTap: () async {
                                  await context
                                      .read<PayMobCubit>()
                                      .getPaymentKey(totalPrice, "EGP")
                                      .then((String paymentKey) {
                                    launchUrl(
                                      Uri.parse(
                                          "https://accept.paymob.com/api/acceptance/iframes/915615?payment_token=$paymentKey"),
                                    );
                                  });
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink(); // Invisible fallback
              }
            },
          ),
        ],
      ),
    );
  }
}
