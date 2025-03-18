import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/features/forget_password/view/screen/enter_code_screen.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ForgetBody extends StatefulWidget {
  const ForgetBody({super.key});

  @override
  State<ForgetBody> createState() => _ForgetBodyState();
}

class _ForgetBodyState extends State<ForgetBody> {
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
            StringApp.forgotPass,
            style: TextStyles.black24,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextFormField(
            hintText: StringApp.emailOrPhone,
            fillColor: ColorsApp.kBackGroundColor,
            controller: controller,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            text: StringApp.continuee,
            style: TextStyles.white16,
            onTap: () {
              NavigationHelper.push(context: context, destination: EnterCodeScreen());
            },
          )
        ],
      ),
    );
  }
}
