import 'package:after_salat/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/compass_screen.dart';
import '../screens/developer_screen.dart';
import '../screens/dua_details_screen.dart';
import '../screens/main_bottom_navbar_screen.dart';
import '../screens/salat_niyot_screen.dart';
import '../screens/salat_screen.dart';
import '../screens/selection_screen.dart';
import '../screens/sura_details_screen.dart';
import '../screens/sura_list_screen.dart';
import '../screens/tasbih_counter_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();
    switch (settings.name) {
      case (SplashScreen.name):
        widget = const SplashScreen();
        break;
      case (SelectionScreen.name):
        widget = const SelectionScreen();
        break;
      case (TasbihCounterScreen.name):
        widget = const TasbihCounterScreen();
        break;
      case (DuaDetailsScreen.name):
        widget = DuaDetailsScreen();
        break;
      case (SalatScreen.name):
        widget = const SalatScreen();
        break;
      case (SuraListScreen.name):
        widget = const SuraListScreen();
        break;
      case (CompassScreen.name):
        widget = const CompassScreen();
        break;
      case (DeveloperScreen.name):
        widget = const DeveloperScreen();
        break;
      case (MainBottomNavbarScreen.name):
        widget = const MainBottomNavbarScreen();
        break;
      case (SuraDetailsScreen.name):
        widget = const SuraDetailsScreen();
        break;
      case (SalatNiyotScreen.name):
        widget = const SalatNiyotScreen();
        break;
    }
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
