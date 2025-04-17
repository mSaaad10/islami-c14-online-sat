import 'package:flutter/material.dart';
import 'package:islami_app_c14_online_sat/config/theme/theme_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.router,
      initialRoute: RoutesManager.splash,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
    );
  }
}

//  vcs
