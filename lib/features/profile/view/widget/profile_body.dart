import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageApp.editIcon,
              colorFilter:
                  ColorFilter.mode(ColorsApp.kPrimaryColor, BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}
