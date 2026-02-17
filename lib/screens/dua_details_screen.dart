import 'package:after_salat/extensions/utils_extension.dart';
import 'package:after_salat/providers/counter_provider.dart';
import 'package:after_salat/screens/tasbih_counter_screen.dart';
import 'package:after_salat/widgets/custom_button.dart';
import 'package:after_salat/widgets/custom_container.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/dua_category.dart';
import '../utils/asset_path.dart';
import '../utils/app_colors.dart';

class DuaDetailsScreen extends StatefulWidget {
  const DuaDetailsScreen({super.key});
  static const String name = '/duaDetailsScreen';

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();
}

class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final DuaCategory category =
        ModalRoute.of(context)!.settings.arguments as DuaCategory;
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(category.title, style: context.textTheme.labelLarge),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: category.items.length,
                  itemBuilder: (context, index) {
                    final dua = category.items[index];
                    return ChangeNotifierProvider(
                      create: (_) => CounterProvider(),
                      child: CustomContainer(
                        child: Column(
                          spacing: 10.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                dua.title,
                                style: context.textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                dua.arabic,
                                style: context.textTheme.bodyMedium,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            if (dua.banglaUcharon != null &&
                                dua.banglaUcharon!.isNotEmpty)
                              Text(
                                'উচ্চারণ: ${dua.banglaUcharon}',
                                style: context.textTheme.titleMedium,
                              ),
                            if (dua.repeat != null && dua.repeat!.isNotEmpty)
                              Text(
                                '- ${dua.repeat}',
                                style: context.textTheme.titleMedium,
                                textAlign: TextAlign.start,
                              ),
                            Divider(color: Colors.white12),
                            if (dua.banglaOrtho != null &&
                                dua.banglaOrtho!.isNotEmpty)
                              Text(
                                'অর্থ: ${dua.banglaOrtho}',
                                style: context.textTheme.titleMedium,
                              ),
                            Divider(color: Colors.white12),
                            if (dua.fojilot != null && dua.fojilot!.isNotEmpty)
                              Text(
                                'ফজিলত: ${dua.fojilot}',
                                style: context.textTheme.titleMedium,
                              ),
                            if (dua.tasbih != null)
                              if (dua.tasbih! < 100)
                                Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AssetsPath.buttonImage),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.blueGrey.shade900,
                                  ),
                                  child: Consumer<CounterProvider>(
                                    builder:
                                        (BuildContext context, counter, _) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              IconButton(
                                                onPressed: counter.decrement,
                                                icon: Icon(
                                                  Icons.remove_circle_rounded,
                                                  color: Colors.yellow.shade700,
                                                  size: 40.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30.h,
                                                child: Text(
                                                  counter.count.toString(),
                                                  style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontFamily: 'Digital',
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.textColor,
                                                    letterSpacing: 2,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  counter.incriment(
                                                    maxCount: dua.tasbih!,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_rounded,
                                                  color: Colors.yellow.shade700,
                                                  size: 40.sp,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                  ),
                                )
                              else
                                CustomButton(
                                  buttonText: 'তাসবীহ',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      TasbihCounterScreen.name,
                                      arguments: dua.banglaUcharon,
                                    );
                                  },
                                ),
                          ],
                        ),
                      ),
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
}
