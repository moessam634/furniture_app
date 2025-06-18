import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import '../../cubit/favorite_cubit.dart';
import '../widget/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: defaultAppBar(
          context: context,
          height: 100.h,
          title: "Favorite",
          style: TextStyles.black24,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CircleAvatar(),
            ),
          ]),
      body: FavoriteBody(),
    );
  }
}
