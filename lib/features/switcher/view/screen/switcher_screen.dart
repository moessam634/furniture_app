import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/features/cart/view/screen/cart_screen.dart';
import 'package:furniture_app/features/favorite/view/screen/favorite_screen.dart';
import 'package:furniture_app/features/home/view/screen/home_screen.dart';
import 'package:furniture_app/features/profile/view/screen/profile_screen.dart';
import 'package:furniture_app/features/switcher/cubit/switcher_cubit.dart';
import 'package:furniture_app/features/switcher/cubit/switcher_state.dart';

class SwitcherScreen extends StatefulWidget {
  const SwitcherScreen({super.key});

  @override
  State<SwitcherScreen> createState() => SwitcherScreenState();
}

Widget _buildIcon(String iconPath, int index, int currentIndex) {
  final color = index == currentIndex
      ? ColorsApp.kPrimaryColor
      : ColorsApp.kLightTextColor;

  return SvgPicture.asset(
    iconPath,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}

class SwitcherScreenState extends State<SwitcherScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    FavoriteScreen(),
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
              selectedIconTheme: IconThemeData(
                color: ColorsApp.kPrimaryColor,
              ),
              selectedLabelStyle: TextStyles.kPrimaryColor10,
              unselectedItemColor: ColorsApp.kLightTextColor,
              unselectedLabelStyle: TextStyles.kPrimaryColor10
                  .copyWith(color: ColorsApp.kLightTextColor),
              items: [
                BottomNavigationBarItem(
                    icon: _buildIcon(
                        ImageApp.homeIcon, 0, switcherCubit.currentIndex),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: _buildIcon(
                        ImageApp.heartIcon, 1, switcherCubit.currentIndex),
                    label: "Favorite"),
                BottomNavigationBarItem(
                    icon: _buildIcon(ImageApp.shoppingCartIcon, 2,
                        switcherCubit.currentIndex),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: _buildIcon(
                        ImageApp.truckIcon, 3, switcherCubit.currentIndex),
                    label: "Order tracking"),
                BottomNavigationBarItem(
                    icon: _buildIcon(
                        ImageApp.userIcon, 4, switcherCubit.currentIndex),
                    label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
