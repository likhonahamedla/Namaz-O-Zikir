import 'package:after_salat/screens/compass_screen.dart';
import 'package:after_salat/screens/developer_screen.dart';
import 'package:after_salat/screens/salat_screen.dart';
import 'package:after_salat/screens/selection_screen.dart';
import 'package:after_salat/screens/sura_list_screen.dart';
import 'package:after_salat/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});
  static const String name = 'mainBottomNavbarScreen';

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  int _currentIndex = 2;
  final List _screens = [
    SalatScreen(),
    SuraListScreen(),
    SelectionScreen(),
    CompassScreen(),
    DeveloperScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.bannerButtonColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
          child: GNav(
            rippleColor: Colors.black,
            hoverColor: Colors.grey[900]!,
            gap: 4,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.black54,
            color: Colors.grey[400],
            tabs: [
              GButton(
                icon: LineIcons.mosque,
                text: 'নামাজ',
                textStyle: TextStyle(fontSize: 14.sp),
              ),
              GButton(
                icon: LineIcons.bookOpen,
                text: 'সূরা',
                textStyle: TextStyle(fontSize: 14.sp),
              ),
              GButton(
                icon: LineIcons.home,
                text: 'হোম',
                textStyle: TextStyle(fontSize: 14.sp),
              ),
              GButton(
                icon: LineIcons.compass,
                text: 'কম্পাস',
                textStyle: TextStyle(fontSize: 14.sp),
              ),
              GButton(
                icon: LineIcons.laptopCode,
                text: 'ডেভ',
                textStyle: TextStyle(fontSize: 14.sp),
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
