import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';
import 'package:islami_app_c14_online_sat/core/widgets/loading_widget.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/hadith/widgets/hadith_content.dart';

class HadithCard extends StatefulWidget {
  const HadithCard({super.key, required this.index});

  final int index;

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  HadithDM? hadithDM;

  @override
  void initState() {
    super.initState();

    loadHadithContent();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.hadithDetails,
            arguments: hadithDM);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ColorsManager.gold,
            image: const DecorationImage(
                image: AssetImage(AssetsManager.hadithCardBackground))),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsManager.quranDetailsShapeLeft,
                      color: ColorsManager.black,
                    ),
                    Image.asset(
                      AssetsManager.quranDetailsShapeRight,
                      color: ColorsManager.black,
                    ),
                  ],
                ),
                hadithDM != null
                    ? Text(
                        hadithDM!.title,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.black),
                      )
                    : Container(),
              ],
            ),
            Expanded(
              child: hadithDM != null
                  ? HadithContent(
                      content: hadithDM!.content,
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const LoadingWidget(color: ColorsManager.black),
            ),
            Image.asset(
              AssetsManager.hadithCardBottomImage,
            ),
          ],
        ),
      ),
    );
  }

  void loadHadithContent() async {
    String filePath = "assets/files/hadith/h${widget.index}.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.trim().split('\n');
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      hadithDM = HadithDM(title: title, content: content);
    });
  }
}

class HadithDM {
  String title;
  String content;

  HadithDM({required this.title, required this.content});
}
