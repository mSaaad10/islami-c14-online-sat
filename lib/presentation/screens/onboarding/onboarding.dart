import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
            bodyWidget: Text('data'),
            image: Image.asset(
              AssetsManager.mosque,
              height: 171,
              width: 291,
            ),
            titleWidget: Image.asset(
              AssetsManager.onboarding1,
              height: 338,
              width: 378,
            ),
            // useScrollView: false
          ),
          PageViewModel(
            bodyWidget: Text('data'),
            image: Image.asset(
              AssetsManager.mosque,
              height: 171,
              width: 291,
            ),
            titleWidget: Image.asset(
              AssetsManager.onboarding2,
              height: 338,
              width: 378,
            ),
            // useScrollView: false
          ),
          PageViewModel(
            bodyWidget: Text('data'),
            image: Image.asset(
              AssetsManager.mosque,
              height: 171,
              width: 291,
            ),
            titleWidget: Image.asset(
              AssetsManager.onboarding3,
              height: 338,
              width: 378,
            ),
            // useScrollView: false
          ),
          PageViewModel(
            bodyWidget: Text('data'),
            image: Image.asset(
              AssetsManager.mosque,
              height: 171,
              width: 291,
            ),
            titleWidget: Image.asset(
              AssetsManager.onboarding4,
              height: 338,
              width: 378,
            ),
            // useScrollView: false
          ),
          PageViewModel(
            bodyWidget: Text('data'),
            image: Image.asset(
              AssetsManager.mosque,
              height: 171,
              width: 291,
            ),
            titleWidget: Image.asset(
              AssetsManager.onboarding5,
              height: 338,
              width: 378,
            ),
            // useScrollView: false
          ),
        ],

        showSkipButton: true,
        next: Text("Next"),
        showNextButton: false,
        skip: const Text("Skip"),
        done: const Text("Finish"),
        showBackButton: true,
        back:const Text("Back"),
        dotsDecorator: const DotsDecorator(
           activeSize: Size(13, 7),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        onDone: () {
          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
        });

  }
}
