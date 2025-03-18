import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColumnImageText extends StatelessWidget {
  const CustomColumnImageText({
    super.key,
    required this.image,
    required this.text,
    this.style,
    this.innerHeight = 30,
    this.outerHeight = 92,
  });

  final String image;
  final String text;
  final double? innerHeight;
  final double? outerHeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: outerHeight?.h,
        ),
        Image.asset(
          image,
        ),
        SizedBox(
          height: innerHeight?.h,
        ),
        Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
