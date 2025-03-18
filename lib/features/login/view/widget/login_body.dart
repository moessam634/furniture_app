import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/features/forget_password/view/screen/forget_screen.dart';
import 'package:furniture_app/features/login/view/widget/social_login_buttons.dart';
import 'package:furniture_app/features/sign_up/view/screen/sign_up_screen.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_column_image_text.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'custom_text_rich.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomColumnImageText(
            image: ImageApp.loginPic,
            text: StringApp.logInYourAcc,
            style: TextStyles.black24,
            innerHeight: 25.h,
            outerHeight: 60.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextFormField(
            hintText: AutofillHints.email,
            fillColor: ColorsApp.kSecondaryColor,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            focusColor: ColorsApp.kBackGroundColor,
          ),
          SizedBox(
            height: 19.h,
          ),
          CustomTextFormField(
            hintText: AutofillHints.password,
            fillColor: ColorsApp.kSecondaryColor,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObscure,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? Icon(
                        CupertinoIcons.eye_slash,
                        size: 20,
                      )
                    : Icon(
                        CupertinoIcons.eye,
                        size: 20,
                      )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  NavigationHelper.push(
                      context: context, destination: ForgetScreen());
                },
                child: Text(
                  StringApp.forgetPass,
                  style: TextStyles.kPrimaryColor16,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            text: StringApp.logIn,
            style: TextStyles.white18,
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomDividerWidget(
            text: StringApp.or,
            style: TextStyles.black16,
          ),
          SizedBox(
            height: 12.h,
          ),
          SocialLoginButtons(
            icon1: ImageApp.googleIcons,
            icon2: ImageApp.facebookIcon,
            icon3: ImageApp.twitterIcon,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextRich(
            text1: StringApp.doNotHavAnAcc,
            text2: StringApp.signUp,
            onTap: () {
              NavigationHelper.push(
                  context: context, destination: SignUpScreen());
            },
          ),
        ],
      ),
    );
  }
}
