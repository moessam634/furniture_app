import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/validation/auth_validation.dart';
import 'package:furniture_app/features/auth/login/view/widget/social_login_buttons.dart';
import 'package:furniture_app/features/forget_password/view/screen/forget_screen.dart';
import 'package:furniture_app/features/switcher/view/screen/switcher_screen.dart';

import '../../../../../core/styles/image_app.dart';
import '../../../../../core/styles/string_app.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_column_image_text.dart';
import '../../../../../core/widgets/custom_divider_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../register/view/screen/register_screen.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';
import 'custom_text_rich.dart';

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
        create: (context) => LoginCubit(sl()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: state.loginModel.message.toString(),
                  onPressed: () {
                    NavigationHelper.pushUntil(
                      context: context,
                      destination: SwitcherScreen(),
                    );
                  },
                ),
              );
            } else if (state is LoginError) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: state.errorMessage,
                ),
              );
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
                    hintText: AutofillHints.username,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: MyValidators.fullNameValidator,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hintText: AutofillHints.password,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscure,
                    validator: MyValidators.passwordValidator,
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
                  state is LoginLoading
                      ? SpinKitFadingCircle(
                          color: Colors.grey,
                          size: 35,
                        )
                      : CustomButton(
                          text: StringApp.logIn,
                          style: TextStyles.white18,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              cubit.login(
                                name: emailController.text,
                                password: passwordController.text,
                              );
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
                    navigateTo: const RegisterScreen(),
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
