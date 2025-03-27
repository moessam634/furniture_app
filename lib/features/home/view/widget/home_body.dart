import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/widgets/custom_text_form_field.dart';
import 'package:furniture_app/features/home/view/widget/custom_product_card.dart';
import 'custom_categories_buttons.dart';
import 'custom_offers_container.dart';
import 'custom_row_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final searchController = TextEditingController();

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
                  child: CustomTextFormField(
                    hintText: StringApp.search,
                    fillColor: ColorsApp.kBackGroundColor,
                    controller: searchController,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: ColorsApp.kPinPutColor,
                      size: 20,
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.mic,
                          color: ColorsApp.kPrimaryColor,
                          size: 20,
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          CupertinoIcons.camera,
                          color: ColorsApp.kPrimaryColor,
                          size: 20,
                        ),
                        SizedBox(width: 16.w),
                      ],
                    ),
                    radius: 20.r,
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
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CategoryFilter(),
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
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 204.h,
              child: ListView.separated(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomProductCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 14.w));
                },
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomRowText(
              text: StringApp.chair,
              textButton: StringApp.seeAll,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 204.h,
              child: ListView.separated(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomProductCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 14.w));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
