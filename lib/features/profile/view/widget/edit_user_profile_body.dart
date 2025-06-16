import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_text_form_field.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/widgets/country_code_picker.dart';

class EditUserProfileBody extends StatelessWidget {
  const EditUserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageApp.chair,
                  fit: BoxFit.cover,
                ),
              ),
              CircleAvatar(
                  radius: 26.r,
                  backgroundColor: ColorsApp.kBackGroundColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      color: ColorsApp.kPrimaryColor,
                    ),
                  )),
            ],
          ),
          SizedBox(height: 25.h),
          CustomTextFormField(hintText: "Full Name"),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryCodePicker(
                onChanged: (code) {
                  print('Selected code: $code');
                },
              ),
              SizedBox(width: 8.w),
              Expanded(child: CustomTextFormField(hintText: "Phone")),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(hintText: "Email"),
          SizedBox(height: 20.h),
          CustomTextFormField(hintText: "Address"),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Save",
            style: TextStyles.white18,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
