import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/assets_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  ///  bool   ->
  ///  List  - >1,2 3,
  double _angle = 0;
  int counter = 0;
  List<String> askar = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int currentAskarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.islamiLogo,
              height: size.height * 0.15,
            ),
            SizedBox(height: 10),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    AssetsManager.sebahHead,
                    height: size.height * 0.09,
                  ),
                  Positioned(
                    top: size.height * 0.080,
                    child: Transform.rotate(
                      angle: _angle,
                      child: Image.asset(
                        AssetsManager.sebhaBody,
                        height: size.height * 0.4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.21,
                    child: InkWell(
                      onTap: () {
                        /// code
                        _tapOnSebha();
                      },
                      child: Column(
                        children: [
                          Text(
                            askar[currentAskarIndex % askar.length],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '$counter',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapOnSebha() {
    _angle -= 11;
    counter++;

    if (counter == 33) {
      counter = 0;
      currentAskarIndex++;
    }
    setState(() {});
  }
}
