import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
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
          title: "My Cart",
          style: TextStyles.black24,
          actions: [
            Container(
                width: 60.w,
                height: 60.h,
                padding: const EdgeInsets.all(4),
                margin: EdgeInsets.only(right: 24.w, top: 10.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: ColorsApp.kPrimaryColor, width: 1.5)),
                child: Image.asset(
                  ImageApp.personaImage,
                  fit: BoxFit.contain,
                )),
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
