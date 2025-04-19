import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/presentation/screens/main_layout/tabs/hadith/widgets/hadith_card.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsManager.hadithTabBackgroundImage,
              ))),
      child: Column(
        children: [
          Expanded(flex: 1, child: Image.asset(AssetsManager.islamiLogo)),
          Expanded(
            flex: 4,
            child: CarouselSlider(
                options: CarouselOptions(
                  height: 600,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                ),
                items: List.generate(
                  50,
                  (index) => index + 1,
                )
                    .map(
                      (index) => HadithCard(index: index),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
