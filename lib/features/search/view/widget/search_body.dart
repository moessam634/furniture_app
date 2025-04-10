import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_search_container.dart';
import 'package:furniture_app/features/search/view/widget/custom_search_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Expanded(
                  child: CustomSearchContainer(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Popular search",
            style: TextStyles.black20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Adjust based on screen size
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) {
                return CustomSearchItem(
                  text: "item",
                  image: ImageApp.chair,
                );
              },
              physics:
                  NeverScrollableScrollPhysics(), // If inside a scroll view
            ),
          ),
          Text(
            "Recently search",
            style: TextStyles.black20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Adjust based on screen size
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) {
                return CustomSearchItem(
                  text: "item",
                  image: ImageApp.chair,
                );
              },
              physics:
                  NeverScrollableScrollPhysics(), // If inside a scroll view
            ),
          ),
        ],
      ),
    );
  }
}
