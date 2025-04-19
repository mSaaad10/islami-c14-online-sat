import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/DM/quran_detailsDM.dart';
import 'package:islami_app_c14_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/constant_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/quran/widgets/most_recent_card.dart';

class SuraItem extends StatelessWidget {
  const SuraItem(
      {super.key, required this.suraDM, required this.mostRecentKey});

  final SuraDM suraDM;
  final GlobalKey<MostRecentState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        int suraIndex = int.parse(suraDM.suraIndex) - 1;
        PrefsManager.addSuraIndex(suraIndex);
        Navigator.pushNamed(context, RoutesManager.quranDetails,
            arguments: QuranDetailsArguments(
                suraDM: suraDM, mostRecentKey: mostRecentKey));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberBackground),
              Text(
                suraDM.suraIndex,
                style: TextStyle(
                    fontSize: 12,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            children: [
              Text(
                suraDM.suraNameEn,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white),
              ),
              Text(
                suraDM.versesNumber,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDM.suraNameAr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white),
          ),
        ],
      ),
    );
  }
}
