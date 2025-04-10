import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/text_styles.dart';

class CustomLogOutDialog extends StatelessWidget {
  final String title, subtitle;
  final void Function()? onTap;

  const CustomLogOutDialog({
    super.key,
    required this.title,
    this.onTap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.black22,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.black16,
          ),
        ],
      ),
      actions: [
        CustomButton(
          text: "log out",
          style: TextStyles.kPrimaryColor18,
          color: Colors.white,
          onTap: onTap,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomButton(
          text: "cancel",
          style: TextStyles.white18,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
