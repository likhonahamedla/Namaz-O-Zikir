import 'package:after_salat/models/dua_category.dart';
import 'package:after_salat/screens/dua_details_screen.dart';
import 'package:after_salat/utils/asset_path.dart';
import 'package:after_salat/widgets/tasbih_banner.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/utils_extension.dart';
import '../utils/app_colors.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});
  static const String name = '/selectionScreen';

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 10.h),
              Text(
                'আসসালামু আলাইকুম(ٱلسَّلَامُ عَلَيْكُمْ)',
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),
              TasbihBanner(),
              SizedBox(height: 10.h),
              Text(
                'ফরজ সালাত পরবর্তী জিকির-আযকার :',
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: duaCategories.length,
                  itemBuilder: (context, index) {
                    final category = duaCategories[index];
                    return InkWell(
                      child: Container(
                        height: 50.h,
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
                          category.title,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelLarge,
                        ),
                      ),
                      onTap: () {
                        _selectionButton(category);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectionButton(DuaCategory category) {
    Navigator.pushNamed(context, DuaDetailsScreen.name, arguments: category);
  }
}
