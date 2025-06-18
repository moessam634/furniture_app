import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../favorite/cubit/favorite_cubit.dart';
import '../../../product_details/view/screen/product_details_screen.dart';
import '../../home_cubit/products_cubit/product_cubit.dart';
import '../../home_cubit/products_cubit/product_state.dart';
import 'custom_product_card.dart';

class AllProductsBody extends StatefulWidget {
  const AllProductsBody({super.key});

  @override
  State<AllProductsBody> createState() => _AllProductsBodyState();
}

class _AllProductsBodyState extends State<AllProductsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Center(
            child: SpinKitFadingCircle(
              size: 25,
              color: Colors.grey,
            ),
          );
        } else if (state is ProductFailureState) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: Text(
                state.errorMessage,
                style: TextStyles.kPrimaryColor16
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          );
        } else if (state is ProductSuccessState) {
          final products = state.products;
          return ListView(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                child: Column(children: [
                  if (products.isEmpty)
                    Center(
                      child: Text(
                        'لا توجد منتجات متاحة حالياً',
                        style: TextStyles.kPrimaryColor16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    )
                  else
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220.h,
                        crossAxisSpacing: 30.w,
                        mainAxisSpacing: 12.h,
                      ),
                      cacheExtent: 220.h,
                      itemCount: products.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final isFav = context
                            .read<FavoriteCubit>()
                            .isFavorite(product.id);
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.w),
                          child: CustomProductCard(
                            onIconPressed: () {
                              context
                                  .read<FavoriteCubit>()
                                  .toggleFavorite(product);
                              setState(() {});
                            },
                            title: product.name,
                            price: product.price,
                            onTap: () {
                              NavigationHelper.push(
                                context: context,
                                destination:
                                    ProductDetailsScreen(productModel: product),
                              );
                            },
                            image: product.images.first,
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .addToCart(productId: product.id);
                              customSnackBar(
                                  context: context,
                                  text: "تم إضافة المنتج إلى السلة",
                                  backgroundColor: Colors.green);
                            },
                            isFavorite: isFav,
                          ),
                        );
                      },
                    ),
                ]))
          ]);
        }
        return SizedBox.shrink();
      },
    );
  }
}
