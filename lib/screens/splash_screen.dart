import 'package:after_salat/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main_bottom_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveNextScreen();
  }

  Future<void> _moveNextScreen() async {
    await Future.delayed(Duration(seconds: 1));
    final locationPermission = await Permission.locationWhenInUse.status;
    if (!mounted) return;
    if (locationPermission.isGranted) {
      Navigator.pushReplacementNamed(context, MainBottomNavbarScreen.name);
    } else if (locationPermission.isDenied) {
      final request = await Permission.locationWhenInUse.request();
      Navigator.pushReplacementNamed(context, MainBottomNavbarScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AssetsPath.app_logo)),
    );
  }
}
