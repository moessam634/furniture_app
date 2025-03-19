import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';

class TapGestureHelper {
  static TapGestureRecognizer navigateToScreen(
      {required BuildContext context, required Widget screen}) {
    return TapGestureRecognizer()
      ..onTap = () {
        NavigationHelper.push(context: context, destination: screen);
      };
  }
}
