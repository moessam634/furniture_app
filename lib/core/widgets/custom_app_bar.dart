import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

PreferredSize defaultAppBar({
  required BuildContext context,
  required String title,
  required TextStyle style,
  Widget? leading,
  List<Widget>? actions,
  double? height,
  double topPadding = 0,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight((height ?? 56.h) + topPadding),
    child: AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: height ?? 56.h,
      leading: leading,
      title: Text(
        title,
        style: style,
      ),
      centerTitle: true,
      actions: actions,
    ),
  );
}
