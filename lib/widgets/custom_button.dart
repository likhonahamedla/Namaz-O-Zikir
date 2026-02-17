import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/asset_path.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 10.h),
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
            image: AssetImage(AssetsPath.buttonImage),
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
