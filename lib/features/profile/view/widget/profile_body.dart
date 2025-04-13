import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/auth/login/view/screen/login_screen.dart';
import 'package:furniture_app/features/profile/view/widget/custom_row_item.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/storage_helper.dart';
import 'custom_log_out_dialog.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  Future<void> logout({required BuildContext context}) async {
    await sl<StorageHelper>().removeToken();
    if (context.mounted) {
      await NavigationHelper.pushUntil(
        context: context,
        destination: LoginScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20.h,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "My Profile",
                style: TextStyles.black24,
              ),
              ListTile(
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.all(0),
                leading: Container(
                  decoration: ShapeDecoration(
                    shape: OvalBorder(),
                  ),
                  width: 70.w,
                  height: 70.h,
                  child: Image.asset(
                    ImageApp.chair,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  "Omar Ali",
                  style: TextStyles.black22,
                ),
                subtitle: Text(
                  "OmarAli2000@gmail.com",
                  style: TextStyles.black14,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    ImageApp.editIcon,
                  ),
                ),
              ),
              Divider(),
              CustomRowItem(
                leadingIcon: Icons.battery_charging_full,
                text: 'History of order',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.credit_card,
                text: 'Payment methods',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.notifications_none_outlined,
                text: 'Notifications',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: CupertinoIcons.arrow_2_circlepath,
                text: 'Reward card',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.abc,
                text: 'Promo code',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.privacy_tip_outlined,
                text: 'Privacy & policy',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.language,
                text: 'Language',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.help_outline,
                text: 'Help',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.share_outlined,
                text: 'Share app',
                onTap: () {},
              ),
              CustomRowItem(
                leadingIcon: Icons.login,
                text: 'Log out',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomLogOutDialog(
                        title: "Log out",
                        subtitle: 'Are you sure you want to\nlog out?',
                        onTap: () async {
                          await logout(context: context);
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
