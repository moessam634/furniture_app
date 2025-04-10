import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/features/forget_password/view/screen/reset_password_screen.dart';

import '../../../../../core/helper/navigation_helper.dart';
import '../../../../../core/styles/image_app.dart';
import '../../../../../core/styles/string_app.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

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
