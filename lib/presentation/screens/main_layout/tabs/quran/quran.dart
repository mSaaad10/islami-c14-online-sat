import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/constant_manager.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/quran/widgets/most_recent_card.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/quran/widgets/sura_item.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  String searchKey = "";

  GlobalKey<MostRecentState> mostRecentKey = GlobalKey<MostRecentState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.quranTabBackground))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.islamiLogo),
              buildSearchField(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Most Recently",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.ofWhite),
              ),
              const SizedBox(
                height: 10,
              ),
              MostRecent(
                key: mostRecentKey,
              ),
              const SizedBox(
                height: 11,
              ),
              const Text(
                "Suras List",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.ofWhite),
              ),
              const SizedBox(
                height: 14,
              ),
              buildSurasList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSurasList() {
    List<SuraDM> filteredList = ConstantManager.suras;
    filteredList = filteredList
        .where(
          (suraDM) =>
              suraDM.suraNameEn
                  .toUpperCase()
                  .contains(searchKey.toUpperCase()) ||
              suraDM.suraNameAr.contains(searchKey),
        )
        .toList();

    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
              color: ColorsManager.white,
              thickness: 1,
              indent: 64,
              endIndent: 64,
            ),
        itemBuilder: (context, index) => SuraItem(
              suraDM: filteredList[index],
              mostRecentKey: mostRecentKey,
            ),
        itemCount: filteredList.length);
  }

  Widget buildSearchField() {
    return SizedBox(
      height: 55,
      child: TextField(
        onChanged: (userInput) {
          setState(() {
            searchKey = userInput;
          });
        },
        cursorColor: ColorsManager.gold,
        style: TextStyle(
            fontSize: 18,
            color: ColorsManager.ofWhite,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          labelText: "sura name",
          labelStyle: TextStyle(
              color: ColorsManager.ofWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
        ),
      ),
    );
  }
}
