import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_network_image.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/favorite/cubit/favorite_cubit.dart';
import 'package:furniture_app/features/home/model/home_model/product_model.dart';
import 'package:furniture_app/features/product_details/view/widget/product_details_app_bar.dart';
import '../../../../core/widgets/custom_counter_container.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../favorite/cubit/favorite_state.dart';
import 'custom_circle_container.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  late String selectedImage;
  int quantity = 0;
  late bool isFavorite;
  late double pricePerItem;
  double totalPrice = 0.0;

  void incrementQuantity() {
    setState(() {
      quantity++;
      totalPrice = quantity * pricePerItem;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        totalPrice = quantity * pricePerItem;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    selectedImage = (widget.productModel.images != null &&
            widget.productModel.images!.isNotEmpty)
        ? widget.productModel.images!.first
        : "https://via.placeholder.com/150";
    isFavorite =
        context.read<FavoriteCubit>().isFavorite(widget.productModel.id!);
    pricePerItem = double.tryParse(widget.productModel.price ?? '0') ?? 0;
    quantity = 1;
    totalPrice = pricePerItem * quantity;
  }

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
              decoration: BoxDecoration(color: ColorsApp.kBackGroundColor),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomCircleContainer(image: selectedImage),
                  SizedBox(height: 4.h),
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
            SizedBox(height: 36.h),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(widget.productModel.name ?? "",
                              style: TextStyles.black24),
                        ),
                        Text(
                            "\$ ${totalPrice.toStringAsFixed(1)}",
                            style: TextStyles.black24),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text("Details",
                        style: TextStyles.black16
                            .copyWith(color: ColorsApp.kDarkTextColor)),
                    SizedBox(height: 5.h),
                    Text(
                      widget.productModel.description ?? "",
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
                        widget.productModel.images?.length ?? 0,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedImage =
                                    widget.productModel.images?[index] ?? "";
                              });
                            },
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: CustomNetworkImage(
                                  image:
                                      widget.productModel.images?[index] ?? ""),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "Add to Cart",
                      style: TextStyles.white18,
                      onTap: () async {
                        if (quantity > 0) {
                          final message = await context
                              .read<CartCubit>()
                              .addToCart(
                                  productId: widget.productModel.id!,
                                  quantity: quantity);
                          customSnackBar(
                              context: context,
                              text: message,
                              backgroundColor: Colors.green);
                        } else {
                          customSnackBar(
                              context: context,
                              text: "   يجب تحديد الكميه   ",
                              backgroundColor: Colors.red);
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final isFavorite = context
                .read<FavoriteCubit>()
                .isFavorite(widget.productModel.id!);
            return ProductDetailsAppBar(
              icon: isFavorite ? ImageApp.filledHeart : ImageApp.heartIcon,
              onPressed: () {
                context
                    .read<FavoriteCubit>()
                    .toggleFavorite(widget.productModel);
              },
            );
          },
        ),
        Positioned(
          top: .434.sh,
          left: 0,
          right: 0,
          child: Center(
            child: CustomCounterContainer(
              text: quantity.toString(),
              onPressedPlus: incrementQuantity,
              onPressedMinus: decrementQuantity,
            ),
          ),
        )
      ],
    );
  }
}
