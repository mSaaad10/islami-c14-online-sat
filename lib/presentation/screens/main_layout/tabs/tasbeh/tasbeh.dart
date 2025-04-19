import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => tasbeh_State();
}

class tasbeh_State extends State<Tasbeh> {
  double angle = 0.0;
  int counter = 0;
  List<String> athkar = ['سبحان الله' ,'الحمد لله', 'الله اكبر'];
  int currentAthkarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.sebha_background),
              fit: BoxFit.cover,
              opacity: 0.25)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.mosque,
              height: 96.h,
              width: 166.w,
            ),
            const Text(
             'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    AssetsManager.sebha_head,
                    height: 96.h,
                    width: 166.w,
                  ),
                  Positioned(
                    top: 75.h,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        AssetsManager.sebha_body,
                        height: 381.h,
                        width: 379.w,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 200.h,
                      child: InkWell(
                        onTap: () {
                          _onClick();
                        },
                        child:  Column(
                          children: [
                             Text(
                              athkar[currentAthkarIndex % athkar.length],
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsManager.white),
                            ),
                            Text(
                              "$counter",
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClick() {
    angle += 10.0;
    counter++;
    if(counter==33){
      counter =0;
      currentAthkarIndex++;
    }
    setState(() {});
  }
}
