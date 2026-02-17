import 'package:after_salat/extensions/utils_extension.dart';
import 'package:after_salat/utils/asset_path.dart';
import 'package:after_salat/utils/app_colors.dart';
import 'package:after_salat/widgets/custom_button.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihCounterScreen extends StatefulWidget {
  const TasbihCounterScreen({super.key});
  static const String name = '/tasbihCounterScreen';

  @override
  State<TasbihCounterScreen> createState() => _TasbihCounterScreenState();
}

class _TasbihCounterScreenState extends State<TasbihCounterScreen>
    with SingleTickerProviderStateMixin {
  int count = 0;
  int maxCount = 100;

  late AnimationController _controller;

  Future<void> _saveCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('_countKey', count);
  }

  Future<void> _loadCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int saveCount = sharedPreferences.getInt('_countKey') ?? 0;
    setState(() {
      count = saveCount;
      _controller.value = count / maxCount;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _loadCount();
  }

  void _increment() {
    if (count >= maxCount) return;

    setState(() {
      count++;
      _controller.value = count / maxCount;
    });
    _saveCount();
  }

  void _decrement() {
    if (count <= 0) return;
    setState(() {
      count--;
      _controller.value = count / maxCount;
    });
    _saveCount();
  }

  void _restart() {
    setState(() {
      count = 0;
      _controller.value = 0;
    });
    _saveCount();
  }

  @override
  Widget build(BuildContext context) {
    final String bangla = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'بسم الله الرحمن الرحيم',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20.h),
              // if (bangla != null && bangla!.isNotEmpty)
              Text(
                bangla,
                style: GoogleFonts.hindSiliguri(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor,
                ),
              ),
              SizedBox(
                width: 275.w,
                height: 275.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 225.h,
                      width: 260.w,
                      child: CircularProgressIndicator(
                        value: _controller.value,
                        strokeWidth: 10.w,
                        color: AppColor.textColor,
                      ),
                    ),
                    Container(
                      height: 250.h,
                      width: 230.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryButtonColor,
                        image: DecorationImage(
                          image: AssetImage(AssetsPath.buttonImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        '$count',
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 80.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.duaBackground),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.blueGrey.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: _decrement,
                      icon: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.yellow.shade700,
                        size: 80.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: _increment,
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: Colors.yellow.shade700,
                        size: 80.sp,
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              CustomButton(buttonText: 'নতুন করে', onTap: _restart),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
