import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import '../../../../core/utils/service_locator.dart';
import '../../cubit/pay_mob_cubit/pay_mob__cubit.dart';
import '../widget/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: defaultAppBar(
          context: context,
          height: 120.h,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          title: "My Cart",
          style: TextStyles.black24,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CircleAvatar(),
            ),
          ]),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<CartCubit>()),
          BlocProvider(create: (context) => sl<PayMobCubit>()),
        ],
        child: CartBody(),
      ),
    );
  }
}
