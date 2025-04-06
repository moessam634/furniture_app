import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            ListTile(
              leading: CircleAvatar(),
              title: Text(
                "Omar Ali",
                style: TextStyles.black22,
              ),
              subtitle: Text(
                "OmarAli2000@gmail.com",
                style: TextStyles.black14,
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.import_contacts_sharp)),
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
