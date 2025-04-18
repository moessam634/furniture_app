import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/features/forget_password/view/screen/reset_password_screen.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class EnterCodeSignUpBody extends StatefulWidget {
  const EnterCodeSignUpBody({super.key});

  @override
  State<EnterCodeSignUpBody> createState() => _EnterCodeSignUpBodyState();
}

class _EnterCodeSignUpBodyState extends State<EnterCodeSignUpBody> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: TextStyles.kPinPutColor30,
    decoration: BoxDecoration(
        color: ColorsApp.kBackGroundColor,
        border: Border(
          bottom: BorderSide(
              color: ColorsApp.kPrimaryColor.withAlpha(100), width: 4),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
        shape: BoxShape.rectangle),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Image.asset(ImageApp.forgetPassword),
          SizedBox(
            height: 25.h,
          ),
          Text(
            StringApp.enterCode,
            style: TextStyles.black24,
          ),
          SizedBox(
            height: 25.h,
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border(
                  bottom: BorderSide(color: ColorsApp.kPrimaryColor, width: 4),
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: ColorsApp.kSecondaryColor),
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  StringApp.resendCode,
                  style: TextStyles.kPrimaryColor16,
                )),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            text: StringApp.continuee,
            style: TextStyles.white16,
            onTap: () {
              NavigationHelper.push(
                  context: context, destination: ResetPasswordScreen());
            },
          )
        ],
      ),
    );
  }
}
