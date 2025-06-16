import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/switcher/view/screen/switcher_screen.dart';
import '../../../../core/widgets/custom_button.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(ImageApp.congratulationImage),
          SizedBox(height: 25.h),
          Text(
            "Congratulation",
            style: TextStyles.black24,
          ),
          SizedBox(height: 8.h),
          Text(
            "payment completed Successfully",
            style:
                TextStyles.white18.copyWith(color: ColorsApp.kLightTextColor),
          ),
          SizedBox(height: 30.h),
          CustomButton(
            text: 'Back to home',
            style: TextStyles.white18,
            onTap: () {
              NavigationHelper.pushUntil(
                  context: context, destination: SwitcherScreen());
            },
          )
        ]),
      ),
    );
  }
}
