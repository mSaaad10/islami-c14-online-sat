import 'package:flutter/cupertino.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/main_layout.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/onboarding/onboarding.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const splash = "/splash";
  static const mainLayout = "/mainLayout";
  static const onboarding = "/";

  static Map<String, WidgetBuilder> router = {
    splash: (_) => const Splash(),
    mainLayout: (_) => MainLayout(),
    onboarding: (_)=> const OnBoarding()
  };
}
