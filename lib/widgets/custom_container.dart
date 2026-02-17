import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/asset_path.dart';
import '../utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 12.r,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
        color: AppColor.primaryButtonColor,
        image: DecorationImage(
          image: AssetImage(AssetsPath.duaBackground),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: child,
    );
  }
}
