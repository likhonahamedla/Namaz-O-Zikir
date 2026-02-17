import 'package:after_salat/screens/tasbih_counter_screen.dart';
import 'package:after_salat/utils/asset_path.dart';
import 'package:after_salat/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TasbihBanner extends StatelessWidget {
  const TasbihBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsPath.tasbih)),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, bottom: 10.h),
              child: SizedBox(
                width: 100.w,
                height: 34.h,
                child: ElevatedButton(
                  onPressed: () {
                    _tasbihButton(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.bannerButtonColor,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'তাসবীহ',
                    style: GoogleFonts.hindSiliguri(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tasbihButton(BuildContext context) {
    Navigator.pushNamed(context, TasbihCounterScreen.name, arguments: 'তাসবীহ');
  }
}
