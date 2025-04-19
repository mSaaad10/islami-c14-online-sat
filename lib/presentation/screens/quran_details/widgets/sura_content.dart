import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';

class SuraContent extends StatelessWidget {
  const SuraContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Text(
      content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 18, color: ColorsManager.gold),
    ));
  }
}
