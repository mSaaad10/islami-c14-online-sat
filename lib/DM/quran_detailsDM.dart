import 'package:flutter/cupertino.dart';
import 'package:islami_app_c14_online_sat/core/resources/constant_manager.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/quran/widgets/most_recent_card.dart';

class QuranDetailsArguments {
  final SuraDM suraDM;
  final GlobalKey<MostRecentState> mostRecentKey;

  const QuranDetailsArguments(
      {required this.suraDM, required this.mostRecentKey});
}
