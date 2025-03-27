import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/cart/view/screen/cart_screen.dart';
import 'package:furniture_app/features/home/view/screen/home_screen.dart';
import 'package:furniture_app/features/profile/view/screen/profile_screen.dart';
import 'package:furniture_app/features/switcher/cubit/switcher_cubit.dart';
import 'package:furniture_app/features/switcher/cubit/switcher_state.dart';

class SwitcherScreen extends StatefulWidget {
  const SwitcherScreen({super.key});

  @override
  State<SwitcherScreen> createState() => SwitcherScreenState();
}

class SwitcherScreenState extends State<SwitcherScreen> {
  List<Widget> screens = [
    HomeScreen(),
    SizedBox(),
    CartScreen(),
    SizedBox(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitcherCubit(),
      child: BlocBuilder<SwitcherCubit, SwitcherState>(
        builder: (context, state) {
          SwitcherCubit switcherCubit = BlocProvider.of(context);
          return Scaffold(
            body: screens[switcherCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: switcherCubit.currentIndex,
              onTap: switcherCubit.changeScreen,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              fixedColor: ColorsApp.kPrimaryColor,
              unselectedItemColor: ColorsApp.kLightTextColor,
              selectedLabelStyle: TextStyles.kPrimaryColor10,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(ImageApp.homeIcon), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(ImageApp.shoppingIcon),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(ImageApp.truckIcon),
                    label: "Order tracking"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
