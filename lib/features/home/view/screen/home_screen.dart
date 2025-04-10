import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/home_cubit.dart';
import 'package:furniture_app/features/home/view/widget/home_body.dart';

import '../../home_cubit/categories_cubit/categories_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 130.h,
        title: Padding(
          padding: EdgeInsets.only(top: 45.h, left: 8.w),
          child: Text(
            StringApp.letsFurnishYourHome,
            maxLines: 2,
            style: TextStyles.black24.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w, top: 40.h),
            child: CircleAvatar(
              radius: 24.r,
            ),
          )
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoriesCubit()),
          BlocProvider(create: (context) => ProductsCubit()),
        ],
        child: HomeBody(),
      ),
    );
  }
}
