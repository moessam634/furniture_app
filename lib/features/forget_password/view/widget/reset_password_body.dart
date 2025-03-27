import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 199.w,
              height: 160.h,
              child: Image.asset(ImageApp.resetPassword)),
          SizedBox(
            height: 25.h,
          ),
          Text(
            StringApp.resetPass,
            style: TextStyles.black24,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextFormField(
            hintText: StringApp.newPass,
            fillColor: ColorsApp.kSecondaryColor,
            controller: newPasswordController,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 19.h,
          ),
          CustomTextFormField(
            hintText: StringApp.confirmPass,
            fillColor: ColorsApp.kSecondaryColor,
            controller: confirmNewPasswordController,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            text: StringApp.reset,
            style: TextStyles.white18,
          ),
        ],
      ),
    );
  }
}
