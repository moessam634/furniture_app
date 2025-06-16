import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import '../styles/colors_app.dart';

class CountryCodePicker extends StatelessWidget {
  final void Function(String)? onChanged;

  const CountryCodePicker({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: IntlPhoneField(
        initialCountryCode: 'EG',
        onChanged: (phone) {
          if (onChanged != null) {
            onChanged!(phone.countryCode);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsApp.kBackGroundColor,
          isDense: true,
          counterText: '',
          hintText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        disableLengthCheck: true,
        showDropdownIcon: true,
        flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 12),
        dropdownIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        style: const TextStyle(fontSize: 0),
      ),
    );
  }
}
