import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/auth/login/cubit/login_cubit.dart';
import 'package:furniture_app/features/profile/view/widget/profile_body.dart';

import '../../../../core/utils/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}
