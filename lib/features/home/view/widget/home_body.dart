import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/favorite/cubit/favorite_cubit.dart';
import 'package:furniture_app/features/favorite/cubit/favorite_state.dart';
import 'package:furniture_app/features/home/home_cubit/categories_cubit/categories_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_state.dart';
import 'package:furniture_app/features/home/view/screen/all_products_screen.dart';
import 'package:furniture_app/features/home/view/widget/custom_category_item.dart';
import 'package:furniture_app/features/home/view/widget/custom_product_card.dart';
import 'package:furniture_app/features/product_details/view/screen/product_details_screen.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_search_container.dart';
import '../../../search/view/screen/search_screen.dart';
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

  void _initialize() async {
    // Load categories and products
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  String _getCategoryDisplayText() {
    if (selectedCategory == "الكل" || selectedCategory == "All") {
      return "جميع المنتجات";
    }
    return selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(height: 20.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 24.w),
          //   child: Row(
          //     children: [
          //       InkWell(
          //         child: Icon(CupertinoIcons.bell, color: ColorsApp.kPrimaryColor),
          //       ),
          //       SizedBox(width: 8.w),
          //       // Expanded(
          //       //   child: CustomSearchContainer(
          //       //       onTap: () {
          //       //         NavigationHelper.push(
          //       //             context: context,
          //       //             destination: SearchScreen()
          //       //         );
          //       //       },
          //       //       icon: CupertinoIcons.camera
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 25.h),
          CustomOffersContainer(
              onTap: () {
                NavigationHelper.push(
                    context: context, destination: AllProductsScreen());
              },
              discountImage: ImageApp.off30,
              productImage: ImageApp.chair

          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(text: StringApp.categories),
          ),

          // Categories Section
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccessState) {
                final categories = state.data.categories;
                return SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 8.w),
                    itemBuilder: (context, index) {
                      print(selectedCategory);
                      final category = categories[index];
                      final isSelected = selectedCategory.trim() ==
                          category.name.trim();
                      print("$isSelected");
                      return CustomCategoryItem(
                        name: category.name,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            selectedCategory = category.name;
                          });
                          if (category.name.trim() == "الكل" ||
                              category.name.trim() == "All") {
                            context.read<ProductsCubit>().resetFilter();
                          } else {
                            context.read<ProductsCubit>().filterByCategory(
                                category.name.trim());
                          }
                        },
                      );
                    },
                  ),
                );
              } else if (state is CategoriesErrorState) {
                return Center(
                  child: Text(
                    'Failed to load categories',
                    style: TextStyles.kPrimaryColor18,
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
              text: _getCategoryDisplayText(),
              textButton: StringApp.seeAll,
              onPressed: () {
                NavigationHelper.push(
                    context: context,
                    destination: AllProductsScreen()
                );
              },
            ),
          ),
          SizedBox(height: 15.h),

          // Products Section
          BlocBuilder<ProductsCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccessState) {
                final products = state.products;

                if (products.isEmpty) {
                  return SizedBox(
                    height: 204.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            selectedCategory == "الكل"
                                ? "لا توجد منتجات"
                                : "لا توجد منتجات في فئة $selectedCategory",
                            style: TextStyles.kPrimaryColor18,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: SizedBox(
                    height: 204.h,
                    child: ListView.separated(
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, favoriteState) {
                            return CustomProductCard(
                              image: product.images.isNotEmpty
                                  ? product.images.first
                                  : '',
                              // Handle empty images
                              title: product.name,
                              price: double
                                  .tryParse(product.price)
                                  ?.toString() ?? product.price,
                              isFavorite: context
                                  .read<FavoriteCubit>()
                                  .isFavorite(product.id),
                              onIconPressed: () {
                                context
                                    .read<FavoriteCubit>()
                                    .toggleFavorite(product);
                              },
                              onTap: () {
                                NavigationHelper.push(
                                  context: context,
                                  destination: ProductDetailsScreen(
                                      productModel: product
                                  ),
                                );
                              },
                              onPressed: () async {
                                final message = await context
                                    .read<CartCubit>()
                                    .addToCart(productId: product.id);

                                // Show result
                                customSnackBar(
                                    context: context,
                                    text: message,
                                    backgroundColor: message.contains('تم')
                                        ? Colors.green
                                        : Colors.red
                                );
                              },
                            );
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 14.w);
                      },
                    ),
                  ),
                );
              } else if (state is ProductFailureState) {
                return Container(
                  height: 204.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        SizedBox(height: 8),
                        Text(
                          state.errorMessage,
                          style: TextStyles.kPrimaryColor18,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: 204.h,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}