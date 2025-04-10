import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/features/home/home_cubit/categories_cubit/categories_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/home_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/home_state.dart';
import 'package:furniture_app/features/home/view/widget/custom_category_item.dart';
import 'package:furniture_app/features/home/view/widget/custom_product_card.dart';
import '../../../../core/widgets/custom_search_container.dart';
import '../../../search/view/screen/search_screen.dart';
import '../../../see_all/view/screen/see_all_screen.dart';
import '../../home_cubit/categories_cubit/categories_state.dart';
import 'categories_screens.dart';
import 'custom_offers_container.dart';
import 'custom_row_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductsCubit>().getProduct();
  }

  Widget? getCategoryScreen(int id, String title) {
    switch (id) {
      case 6:
        return EntrehScreen(title: title);
      case 10:
        return RoknaScreen(title: title);
      case 3:
        return SofraScreen(title: title);
      case 7:
        return KidsRoomScreen(title: title);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    CupertinoIcons.bell,
                    color: ColorsApp.kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: CustomSearchContainer(
                    onTap: () {
                      NavigationHelper.push(
                        context: context,
                        destination: SearchScreen(),
                      );
                    },
                    icon: CupertinoIcons.camera,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomOffersContainer(
            discountImage: ImageApp.off30,
            productImage: ImageApp.chair,
          ),
          SizedBox(
            height: 30.h,
          ),
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
                final selectedIndex = state.selectedIndex;
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
                        isSelected: selectedIndex == index,
                        onTap: () {
                          final categoryId = category.id;
                          final categoryName = category.name;
                          final screen =
                              getCategoryScreen(categoryId, categoryName);
                          context.read<CategoriesCubit>().selectCategory(index);
                          if (screen != null) {
                            NavigationHelper.push(
                              context: context,
                              destination: screen,
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

          SizedBox(
            height: 15.h,
          ),
          // CustomCategoriesButtons(),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
              text: StringApp.sofa,
              textButton: StringApp.seeAll,
            ),
          ),
          BlocBuilder<ProductsCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccessState) {
                final product = state.products;
                return Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: SizedBox(
                    height: 204.h,
                    child: ListView.separated(
                      itemCount: product.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          image: product[index].image.toString(),
                          title: product[index].title.toString(),
                          rate: product[index].ratingModel!.rate!.toDouble(),
                          price: product[index].price!.toDouble(),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(padding: EdgeInsets.only(right: 14.w));
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
              text: StringApp.chair,
              textButton: StringApp.seeAll,
              onPressed: () {
                NavigationHelper.push(
                  context: context,
                  destination: SeeAllScreen(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
