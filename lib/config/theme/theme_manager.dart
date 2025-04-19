import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/core/resources/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.gold,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white,
        )

    ),
  );

  static final ThemeData dark = ThemeData(

  );
}
