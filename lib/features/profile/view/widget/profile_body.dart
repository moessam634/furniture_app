import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/profile/view/widget/custom_list_tile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            SafeArea(
              child: Text(
                "My Profile",
                style: TextStyles.black24,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ListTile(
              leading: Container(
                width: 70.w,
                height: 70.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageApp.chair),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
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
                icon: Icon(Icons.edit),
              ),
            ),
            Divider(),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
            SizedBox(height: 12.h),
            CustomRowItem(
              leadingIcon: Icons.battery_0_bar,
              text: 'History of order',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edgesensor_high),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
