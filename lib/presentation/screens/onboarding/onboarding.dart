import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
  }

  Widget _buildImage(String imagePath,
      [double width = 398, double height = 415]) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
    );
  }

  var bodyStyle = TextStyle(
      color: ColorsManager.gold, fontSize: 19.0, fontWeight: FontWeight.w500);

  late var pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.bold,
          color: ColorsManager.gold),
      bodyTextStyle: bodyStyle,
      // bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: ColorsManager.black,
      imagePadding: EdgeInsets.only(top: 112, left: 16, right: 16),
      imageAlignment: Alignment.bottomCenter,
      imageFlex: 6,
      bodyFlex: 5,
      bodyAlignment: Alignment.bottomCenter);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      freeze: false,
      globalBackgroundColor: ColorsManager.black,
      allowImplicitScrolling: false,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
              child: Image.asset(AssetsManager.islamiLogo,
                  width: 166, height: 96)),
        ),
      ),
      pages: [
        PageViewModel(
          useScrollView: false,
          title: "",
          body: "Welcome To Islami App",
          image: _buildImage(AssetsManager.onBoarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(
            AssetsManager.onBoarding2,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AssetsManager.onBoarding3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AssetsManager.onBoarding4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AssetsManager.onBoarding5),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      done: const Text('Finish',
          style: TextStyle(
              fontSize: 14,
              color: ColorsManager.gold,
              fontWeight: FontWeight.w600)),
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text("Back",
          style: TextStyle(
              fontSize: 14,
              color: ColorsManager.gold,
              fontWeight: FontWeight.w600)),
      next: const Text("Next",
          style: TextStyle(
              fontSize: 14,
              color: ColorsManager.gold,
              fontWeight: FontWeight.w600)),

      curve: Curves.fastLinearToSlowEaseIn,

      dotsDecorator: const DotsDecorator(
        size: Size(7.0, 7.0),
        color: ColorsManager.gray,
        activeColor: ColorsManager.gold,
        activeSize: Size(18.0, 7.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
    ;
  }
}
