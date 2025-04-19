import 'package:flutter/cupertino.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/hadith_details/hadith_details.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/main_layout.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/onboarding/onboarding.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/quran_details/quran_details.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const splash = "/splash";
  static const mainLayout = "/mainLayout";
  static const onBoarding = "/onBoarding";
  static const quranDetails = "/quranDetails";
  static const hadithDetails = "/hadithDetails";

  static Map<String, WidgetBuilder> router = {
    splash: (_) => const Splash(),
    mainLayout: (_) => MainLayout(),
    onBoarding: (_) => OnBoarding(),
    quranDetails: (_) => QuranDetails(),
    hadithDetails: (_) => HadithDetails(),
  };
}
