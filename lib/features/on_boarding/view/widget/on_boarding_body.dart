import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/helper/navigation_helper.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/image_app.dart';
import 'package:furniture_app/core/styles/string_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_column_image_text.dart';
import 'package:furniture_app/features/on_boarding/view/widget/custom_on_boarding_button.dart';
import 'package:furniture_app/features/on_boarding/view/widget/global_header.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../auth/login/view/screen/login_screen.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  OnBoardingBodyState createState() => OnBoardingBodyState();
}

class OnBoardingBodyState extends State<OnBoardingBody> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentIndex = 0;

  void _onIntroEnd(context) {
    NavigationHelper.pushReplacement(
        context: context, destination: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      showBackButton: false,
      globalHeader: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: GlobalHeader(
            icon: currentIndex > 0 ? Icons.arrow_back_ios : null,
            text: StringApp.skip,
            iconOnTap: introKey.currentState?.previous,
            textOnTap: () {
              _onIntroEnd(context);
            },
          ),
        ),
      ),
      initialPage: 0,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: CustomColumnImageText(
            image: ImageApp.onBoarding1,
            text: StringApp.designYourDream,
            style: TextStyles.black20,
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: CustomColumnImageText(
            image: ImageApp.onBoarding2,
            text: StringApp.findThePerfectGift,
            style: TextStyles.black20,
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: CustomColumnImageText(
            image: ImageApp.onBoarding3,
            text: StringApp.weDeliverTheProducts,
            style: TextStyles.black20,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onChange: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      nextFlex: 0,
      showSkipButton: false,
      next: CustomOnBoardingButton(),
      done: CustomOnBoardingButton(
        text: StringApp.done,
      ),
      dotsDecorator: DotsDecorator(
        size: Size(7.w, 7.h),
        color: ColorsApp.kPrimaryColor,
        activeSize: Size(24.w, 7.h),
        activeColor: ColorsApp.kPrimaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100.r),
          ),
        ),
      ),
      controlsPosition: Position(
        bottom: 104.h,
        right: 0,
        left: -500.w,
      ),
    );
  }
}
