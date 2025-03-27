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

AppBar defaultAppBar({
  required BuildContext context,
  required title,
  required Widget action,
}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.white,
    title: title,
    actions: [action],
    centerTitle: true,
  );
}
