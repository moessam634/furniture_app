import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/utils/storage_helper.dart';
import 'package:furniture_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/cart/model/model/cart_products_model.dart';
import 'package:furniture_app/features/favorite/cubit/favorite_cubit.dart';
import 'package:furniture_app/features/favorite/cubit/favorite_state.dart';
import 'package:furniture_app/features/home/home_cubit/categories_cubit/categories_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_state.dart';
import 'package:furniture_app/features/home/view/widget/custom_category_item.dart';
import 'package:furniture_app/features/home/view/widget/custom_product_card.dart';
import 'package:furniture_app/features/product_details/view/screen/product_details_screen.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_search_container.dart';
import '../../../search/view/screen/search_screen.dart';
import '../../../see_all/view/screen/see_all_screen.dart';
import '../../home_cubit/categories_cubit/categories_state.dart';
import 'custom_offers_container.dart';
import 'custom_row_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String selectedCategory = "الكل";

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductsCubit>().getProduct();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                InkWell(
                  child:
                  Icon(CupertinoIcons.bell, color: ColorsApp.kPrimaryColor),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomSearchContainer(
                      onTap: () {
                        NavigationHelper.push(
                            context: context, destination: SearchScreen());
                      },
                      icon: CupertinoIcons.camera),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          CustomOffersContainer(
              discountImage: ImageApp.off30, productImage: ImageApp.chair),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
              text: StringApp.categories,
              textButton: StringApp.seeAll,
              onPressed: () {},
            ),
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccessState) {
                final categories = state.data.categories;
                {
                  return SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CustomCategoryItem(
                          name: category.name,
                          isSelected:
                          selectedCategory.trim() == category.name.trim(),
                          onTap: () {
                            setState(() {
                              selectedCategory = category.name;
                            });

                            if (category.name.trim() == "الكل" ||
                                category.name.trim() == "All") {
                              context.read<ProductsCubit>().resetFilter();
                            } else {
                              context
                                  .read<ProductsCubit>()
                                  .filterByCategory(category.name.trim());
                            }
                          },
                        );
                      },
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
                text: StringApp.sofa, textButton: StringApp.seeAll),
          ),
          SizedBox(height: 15.h),
          BlocBuilder<ProductsCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccessState) {

                final product = state.products;
                if (product.isEmpty) {
                  return Center(
                      child:
                      Text("No Products", style: TextStyles.kPrimaryColor18)
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: SizedBox(
                      height: 204.h,
                      child: ListView.separated(
                        itemCount: product.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, state) {
                              print(product[index].id);
                              return CustomProductCard(
                                image: (product[index].images != null &&
                                    product[index].images!.isNotEmpty)
                                    ? product[index].images!.first
                                    : ImageApp.sofa,
                                title: product[index].name ?? "",
                                price: double.parse(product[index].price ?? '0')
                                    .toString(),
                                isFavorite: context
                                    .read<FavoriteCubit>()
                                    .isFavorite(product[index].id!),
                                onIconPressed: () {
                                    context
                                        .read<FavoriteCubit>()
                                        .toggleFavorite(product[index]);
                                },
                                onTap: () {
                                  NavigationHelper.push(
                                    context: context,
                                    destination: ProductDetailsScreen(
                                        productModel: product[index]),
                                  );
                                },
                                onPressed: () async {
                                  final message = await context
                                      .read<CartCubit>()
                                      .addToCart(productId: product[index].id!);
                                  customSnackBar(
                                      context: context,
                                      text: message,
                                      backgroundColor: Colors.green);
                                },
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(padding: EdgeInsets.only(right: 14.w));
                        },
                      ),
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
