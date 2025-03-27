import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/validation/auth_validation.dart';
import 'package:furniture_app/features/forget_password/view/screen/forget_screen.dart';
import 'package:furniture_app/features/login/cubit/login_cubit.dart';
import 'package:furniture_app/features/login/cubit/login_state.dart';
import 'package:furniture_app/features/login/view/widget/custom_text_rich.dart';
import 'package:furniture_app/features/login/view/widget/social_login_buttons.dart';
import 'package:furniture_app/features/sign_up/view/screen/sign_up_screen.dart';
import 'package:furniture_app/features/switcher/view/screen/switcher_screen.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_column_image_text.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (state.user["status"] == "success") {
                customSnackBar(
                    context: context,
                    text: state.user["message"],
                    backgroundColor: Colors.green);
                NavigationHelper.pushUntil(
                    context: context, destination: SwitcherScreen());
              }
              if (state.user["status"] == "error") {
                customSnackBar(
                    context: context,
                    text: state.user["message"],
                    backgroundColor: Colors.red);
              }
            }
          },
          builder: (context, state) {
            LoginCubit cubit = BlocProvider.of(context);
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomColumnImageText(
                    image: ImageApp.loginPic,
                    text: StringApp.logInYourAcc,
                    style: TextStyles.black24,
                    innerHeight: 15.h,
                    outerHeight: 55.h,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextFormField(
                    hintText: AutofillHints.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return MyValidators.fullNameValidator(value);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hintText: AutofillHints.password,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscure,
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        size: 20,
                      ),
                    ),
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
                    height: 12.h,
                  ),
                  CustomButton(
                    text: StringApp.logIn,
                    style: TextStyles.white18,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        cubit.loginData.loginData(
                            name: emailController.text,
                            password: passwordController.text);
                        NavigationHelper.pushReplacement(
                            context: context, destination: SwitcherScreen());
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomDividerWidget(
                    text: StringApp.or,
                    style: TextStyles.black16,
                  ),
                  SocialLoginButtons(
                    icon1: ImageApp.googleIcons,
                    icon2: ImageApp.facebookIcon,
                    icon3: ImageApp.twitterIcon,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextRich(
                    text1: StringApp.doNotHavAnAcc,
                    text2: StringApp.signUp,
                    navigateTo: const SignUpScreen(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
