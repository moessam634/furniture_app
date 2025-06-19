import 'package:flutter/material.dart';

InputBorder textFormFieldBorder(
    {required double radius,required BorderSide borderSide}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: borderSide,
  );
}
