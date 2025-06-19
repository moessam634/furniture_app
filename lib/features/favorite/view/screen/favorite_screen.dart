import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import '../../../../core/styles/colors_app.dart';
import '../../cubit/favorite_cubit.dart';
import '../widget/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: defaultAppBar(
          context: context,
          height: 100.h,
          title: "Favorite",
          style: TextStyles.black24,
          actions: [
            Container(
                width: 60.w,
                height: 60.h,
                padding: const EdgeInsets.all(4),
                margin: EdgeInsets.only(right: 24.w, top: 20.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: ColorsApp.kPrimaryColor, width: 1.5)),
                child: Image.asset(
                  ImageApp.personaImage,
                  fit: BoxFit.contain,
                )),
          ]),
      body: FavoriteBody(),
    );
  }
}
