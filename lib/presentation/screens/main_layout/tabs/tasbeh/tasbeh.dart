

import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  double _angle=0;
  int counter=0;
  List<String> azkar=["سبحان الله","الحمدلله","لااله الاالله","الله اكبر","لاحول ولا قوه الا بالله"];
  int currentAzkarIndex=0;
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image:AssetImage(AssetsManager.sebhaBackground),
        fit:BoxFit.cover,
      )),
      child:SafeArea(
        child: Column(
          children: [

            Image.asset(AssetsManager.islamiLogo,
            height: size.height*0.15,),
            SizedBox(height: 10,),
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 10,),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(AssetsManager.sebhaHead,height: size.height*0.09,),
                  Positioned(
                      top: size.height*0.08,
                      child: Transform.rotate(
                          angle: _angle,
                          child: Image.asset(AssetsManager.sebhaBody,height: size.height*0.4,))),
                  Positioned(
                      top: size.height*0.22,
                      child: InkWell(
                        onTap: (){
                          _tapOn();
                        },
                        child: Column(
                                            children: [
                        Text("${azkar[currentAzkarIndex % azkar.length]}",
                          style: Theme.of(context).textTheme.bodyLarge,),
                        Text("$counter",
                          style: Theme.of(context).textTheme.bodyLarge,),
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

  void _tapOn() {
    _angle-=10;
    counter++;
    if(counter==34)
      {
        counter=0;
        currentAzkarIndex++;
      }
    setState(() {

    });
  }
}

