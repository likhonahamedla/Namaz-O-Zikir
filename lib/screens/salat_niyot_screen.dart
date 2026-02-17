import 'package:after_salat/extensions/utils_extension.dart';
import 'package:after_salat/models/salat_niyot_model.dart';
import 'package:after_salat/widgets/custom_container.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalatNiyotScreen extends StatelessWidget {
  const SalatNiyotScreen({super.key});
  static const String name = '/niyotScreen';

  @override
  Widget build(BuildContext context) {
    SalatNiyotModel salat =
        ModalRoute.of(context)!.settings.arguments as SalatNiyotModel;

    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Center(
                child: Text(
                  '${salat.salatName} এর নিয়ত',
                  style: context.textTheme.labelLarge,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: salat.itemModel.length,
                  itemBuilder: (context, index) {
                    final niyot = salat.itemModel[index];
                    return CustomContainer(
                      child: Column(
                        spacing: 10.h,
                        children: [
                          Text(
                            niyot.title,
                            style: context.textTheme.titleMedium,
                          ),
                          Text(
                            niyot.arabic,
                            style: context.textTheme.bodyMedium,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            'উচ্চারণ: ${niyot.banglaUcharon}',
                            style: context.textTheme.titleMedium,
                          ),
                          Divider(color: Colors.black26),
                          Text(
                            'অর্থ: ${niyot.banglaOrtho}',
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
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
