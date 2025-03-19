import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/features/login/view/screen/login_screen.dart';
import 'package:furniture_app/features/login/view/widget/social_login_buttons.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_column_image_text.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../login/view/widget/custom_text_rich.dart';
import '../screen/enter_code_sign_up.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

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
            image: ImageApp.createNewAcc,
            text: StringApp.createNewAcc,
            style: TextStyles.black24,
            innerHeight: 25.h,
            outerHeight: 70.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextFormField(
            hintText: StringApp.fullName,
            fillColor: ColorsApp.kSecondaryColor,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            focusColor: ColorsApp.kBackGroundColor,
          ),
          SizedBox(
            height: 19.h,
          ),
          CustomTextFormField(
            hintText: StringApp.emailOrPhone,
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
              icon: Icon(
                isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            text: StringApp.verify,
            style: TextStyles.white18,
            onTap: () {
              NavigationHelper.push(
                  context: context, destination: EnterCodeSignUpScreen());
            },
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
            height: 10.h,
          ),
          CustomTextRich(
              text1: StringApp.doNotHavAnAcc,
              text2: StringApp.logIn,
              navigateTo: const LoginScreen())
        ],
      ),
    );
  }
}
