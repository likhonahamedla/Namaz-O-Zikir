import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static final ThemeData _fixedThemeData = ThemeData(
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
  );
  static TextTheme get _textTheme {
    return TextTheme(
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
    );
  }

  static ThemeData get fixedThemeData => _fixedThemeData;
}
