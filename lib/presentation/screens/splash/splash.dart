import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  void _navigate() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    // });
    /// duration -> build thread
    /// navigate
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.onBoarding);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("ana da5alt el build  ");

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: Image.asset(AssetsManager.splashLogo)),
          Expanded(flex: 1, child: Image.asset(AssetsManager.branding)),
        ],
      ),
    );
  }
}

/// native flutter -> widget
