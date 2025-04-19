import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c14_online_sat/config/theme/theme_manager.dart';
import 'package:islami_app_c14_online_sat/core/routes/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: RoutesManager.router,
            theme: ThemeManager.light,
            darkTheme: ThemeManager.dark,
            themeMode: ThemeMode.light,
          );
        });
  }
}

//  vcs
