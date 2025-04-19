import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/hadith/widgets/hadith_card.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/hadith/widgets/hadith_content.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadithDM hadithDM;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    hadithDM = ModalRoute.of(context)?.settings.arguments as HadithDM;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(hadithDM.title),
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
                    hadithDM.title,
                    style: TextStyle(
                        color: ColorsManager.gold,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                  child: HadithContent(
                content: hadithDM.content,
                contentColor: ColorsManager.gold,
              )),
              Image.asset(AssetsManager.quranDetailsBottomImage)
            ],
          ),
        )
        //content.isEmpty ? Center(child: CircularProgressIndicator(color: ColorsManager.gold,)) : Text(content),
        );
  }
}
