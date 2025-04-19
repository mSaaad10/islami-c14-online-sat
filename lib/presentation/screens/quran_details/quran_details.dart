import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c14_online_sat/DM/quran_detailsDM.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/core/widgets/loading_widget.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/quran_details/widgets/sura_content.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late QuranDetailsArguments arguments;
  String content = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsArguments;
    loadSuraContent(arguments.suraDM.suraIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arguments.mostRecentKey.currentState?.refreshMostRecentSuras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments.suraDM.suraNameEn,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.quranDetailsShapeLeft),
                      Image.asset(AssetsManager.quranDetailsShapeRight)
                    ],
                  ),
                  Text(
                    arguments.suraDM.suraNameAr,
                    style: TextStyle(
                        color: ColorsManager.gold,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                child: content.isEmpty
                    ? const LoadingWidget(color: ColorsManager.gold)
                    : SuraContent(content: content),
              ),
              Image.asset(AssetsManager.quranDetailsBottomImage)
            ],
          ),
        )
        //content.isEmpty ? Center(child: CircularProgressIndicator(color: ColorsManager.gold,)) : Text(content),
        );
  }

  int add(int n1, int n2) {
    return n1 + n2;
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = "assets/files/suras/$suraIndex.txt";
    String suraContent = await rootBundle.loadString(filePath);
    List<String> suraLines = suraContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      content = suraLines.join();
    });
  }
}
