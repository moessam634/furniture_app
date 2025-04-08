import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/validation/auth_validation.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_column_image_text.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../auth/view/screen/login_screen.dart';
import '../../../auth/view/widget/custom_text_rich.dart';
import '../../../auth/view/widget/social_login_buttons.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_state.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
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
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: state.message,
                  onPressed: () {
                    NavigationHelper.pushUntil(
                      context: context,
                      destination: LoginScreen(),
                    );
                  },
                ),
              );
            } else if (state is RegisterError) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: state.errorMessage,
                ),
              );
            }
          },
          builder: (context, state) {
            RegisterCubit cubit = BlocProvider.of(context);
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
                      hintText: StringApp.email,
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
                      hintText: "Phone",
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return MyValidators.phoneValidator(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                        hintText: "Address",
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        validator: MyValidators.fullNameValidator),
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
                    state is RegisterLoading
                        ? SpinKitFadingCircle(
                            color: Colors.grey,
                            size: 35,
                          )
                        : CustomButton(
                            text: StringApp.verify,
                            style: TextStyles.white18,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.registerCubit(
                                  name: nameController.text,
                                  emailOrPhone: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
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
