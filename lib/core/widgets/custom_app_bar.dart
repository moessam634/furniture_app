import 'package:flutter/material.dart';

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
