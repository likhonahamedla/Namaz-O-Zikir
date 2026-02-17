import 'package:after_salat/app/app_route.dart';
import 'package:after_salat/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'After Salat',
          theme: ThemeData(
            colorSchemeSeed: Colors.teal,
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontFamily: 'HindSiliguri',
                fontWeight: FontWeight.w800,
                fontSize: 22.sp,
                color: Colors.white,
              ),
              titleMedium: TextStyle(
                fontFamily: 'HindSiliguri',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.white,
              ),
              titleSmall: TextStyle(
                fontFamily: 'HindSiliguri',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.white,
              ),
              labelLarge: TextStyle(
                fontFamily: 'HindSiliguri',
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.textColor,
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Amiri',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.white,
                height: 2,
                letterSpacing: 0,
                wordSpacing: 1.5,
                locale: const Locale('ar'),
              ),
              displayLarge: TextStyle(
                fontSize: 130.sp,
                fontFamily: 'Digital',
                fontWeight: FontWeight.w900,
                color: AppColor.textColor,
                letterSpacing: 4,
              ),
            ),
          ),
          initialRoute: '/',
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}
