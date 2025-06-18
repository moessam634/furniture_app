import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/home/home_cubit/products_cubit/product_cubit.dart';
import 'package:furniture_app/features/home/view/widget/home_body.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/utils/service_locator.dart';
import '../../home_cubit/categories_cubit/categories_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: Offset(0, 0.08),
      end: Offset(0, -0.08),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 100.h,
        title: Padding(
          padding: EdgeInsets.only(top: 45.h, left: 8.w, bottom: 30.h),
          child: Text(
            StringApp.letsFurnishYourHome,
            maxLines: 2,
            style: TextStyles.black24.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          SlideTransition(
            position: _animation,
            child: Container(
                width: 60.w,
                height: 60.h,
                padding: const EdgeInsets.all(4),
                margin: EdgeInsets.only(right: 24.w, top: 20.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: ColorsApp.kPrimaryColor, width: 1.5),
                ),
                child: Image.asset(
                  ImageApp.personaImage,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<CategoriesCubit>()),
          BlocProvider(create: (context) => sl<ProductsCubit>()),
          BlocProvider(create: (context) => sl<CartCubit>()),
        ],
        child: HomeBody(),
      ),
    );
  }
}
