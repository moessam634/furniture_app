import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/validation/auth_validation.dart';
import 'package:furniture_app/features/login/view/screen/login_screen.dart';
import 'package:furniture_app/features/login/view/widget/social_login_buttons.dart';
import 'package:furniture_app/features/sign_up/cubit/register_cubit.dart';
import 'package:furniture_app/features/sign_up/cubit/register_state.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_column_image_text.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../login/view/widget/custom_text_rich.dart';
import '../screen/enter_code_sign_up.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              customSnackBar(
                context: context,
                text: state.message,
                backgroundColor: Colors.green,
              );
              NavigationHelper.pushUntil(
                context: context,
                destination: LoginScreen(),
              );
            } else if (state is RegisterError) {
              customSnackBar(
                context: context,
                text: state.errorMessage,
                backgroundColor: Colors.red,
              );
            }
            // if (state is RegisterSuccess) {
            //   if (state.userData["status"] == "success") {
            //     customSnackBar(
            //         context: context,
            //         text: state.userData["message"],
            //         backgroundColor: Colors.green);
            //     NavigationHelper.pushUntil(
            //       context: context,
            //       destination: EnterCodeSignUpScreen(),
            //     );
            //   }
            // } else if (state is RegisterError) {
            //   customSnackBar(
            //       context: context,
            //       text: state.errorMessage,
            //       backgroundColor: Colors.red);
            // }
          },
          builder: (context, state) {
            RegisterCubit registerCubit = BlocProvider.of(context);
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomColumnImageText(
                      image: ImageApp.createNewAcc,
                      text: StringApp.createNewAcc,
                      style: TextStyles.black24,
                      innerHeight: 15.h,
                      outerHeight: 60.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: StringApp.fullName,
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return MyValidators.fullNameValidator(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      hintText: StringApp.emailOrPhone,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return MyValidators.emailValidator(value);
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
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // state is RegisterLoading
                    //     ? SpinKitFadingCircle(
                    //         color: Colors.grey,
                    //         size: 35,
                    //       )
                    //     :
                    CustomButton(
                      text: StringApp.verify,
                      style: TextStyles.white18,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          registerCubit.registerCubit(
                              name: nameController.text,
                              emailOrPhone: emailController.text,
                              password: passwordController.text);
                        }
                        // NavigationHelper.push(
                        //     context: context, destination: LoginScreen());
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
                      height: 8.h,
                    ),
                    CustomTextRich(
                      text1: StringApp.doNotHavAnAcc,
                      text2: StringApp.logIn,
                      navigateTo: const LoginScreen(),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
