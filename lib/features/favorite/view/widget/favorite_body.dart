import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_plus_icon.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/widgets/custom_horizontal_product.dart';
import '../../../../core/widgets/custom_search_container.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../cart/cubit/cart_cubit.dart';
import '../../../product_details/view/screen/product_details_screen.dart';
import '../../cubit/favorite_cubit.dart';
import '../../cubit/favorite_state.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FavoriteLoaded) {
                final filtered = state.filteredFavorites;
                final query = state.searchQuery;
                return Column(
                  children: [
                    CustomTextFormField(
                      controller: _searchController,
                      hintText: "بحث",
                      onChanged: (query) {
                        context.read<FavoriteCubit>().searchFavorites(query);
                      },
                      hintStyle: TextStyles.black16.copyWith(
                        color: ColorsApp.kLightTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      radius: 8.r,
                      fillColor: Colors.white,
                      focusedFillColor: Colors.blueGrey.shade50,
                      keyboardType: TextInputType.text,
                      prefixIcon:
                      Icon(Icons.search, color: ColorsApp.kLightTextColor),
                    ),
                    SizedBox(height: 25.h),
                    Expanded(
                      child: filtered.isEmpty
                          ? Center(
                        child: Text(
                          query.isNotEmpty
                              ? "هذا المنتج غير موجود فى المفضله"
                              : "لا توجد عناصر مفضلة",
                          style: TextStyles.black22
                              .copyWith(color: ColorsApp.kPrimaryColor),
                        ),
                      )
                          : ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) {
                          final item = filtered[index];
                          final isFav = context
                              .read<FavoriteCubit>()
                              .isFavorite(item.id);
                          return CustomHorizontalProduct(
                            isFavorite: isFav,
                            onIconPressed: () {
                              context
                                  .read<FavoriteCubit>()
                                  .toggleFavorite(item);
                              setState(() {});
                            },
                            addProductIcon: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: CustomPlusIcon(
                                onTap: () async {
                                  // Use the cubit's method for consistency
                                  final success = await context
                                      .read<FavoriteCubit>()
                                      .addFavoriteToCart(item);

                                  if (success) {
                                    customSnackBar(
                                        context: context,
                                        text: "تمت الإضافة إلى السلة",
                                        backgroundColor: Colors.green);
                                    context
                                        .read<FavoriteCubit>()
                                        .toggleFavorite(item);
                                  } else {
                                    customSnackBar(
                                        context: context,
                                        text: "فشل في إضافة المنتج إلى السلة",
                                        backgroundColor: Colors.red);
                                  }
                                },
                              ),
                            ),
                            onTap: () {
                              NavigationHelper.push(
                                  context: context,
                                  destination: ProductDetailsScreen(
                                      productModel: item));
                            },
                            title: item.name,
                            price: double.parse(item.price).toString(),
                            image: item.images.first,
                            rate: "4.5",
                            onPressed: (_) {
                              context
                                  .read<FavoriteCubit>()
                                  .toggleFavorite(item);
                            },
                          );
                        },
                      ),
                    ),
                    if (filtered.isNotEmpty)
                      CustomButton(
                          text: "اضافه الى السله",
                          onTap: () async {
                            final favCubit = context.read<FavoriteCubit>();

                            // Use the cubit's method to add all favorites to cart
                            final success = await favCubit.addAllFavoritesToCart();

                            if (success) {
                              customSnackBar(
                                context: context,
                                text: "تمت إضافة جميع العناصر إلى السلة",
                                backgroundColor: Colors.green,
                              );
                              // Clear favorites after successful addition
                              await favCubit.clearFavorites();
                            } else {
                              customSnackBar(
                                context: context,
                                text: "فشل في إضافة العناصر إلى السلة",
                                backgroundColor: Colors.red,
                              );
                            }
                          },
                          style: TextStyles.white16)
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
