import 'package:after_salat/utils/asset_path.dart';
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetsPath.background, fit: BoxFit.cover),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
