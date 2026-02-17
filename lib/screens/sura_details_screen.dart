import 'package:after_salat/models/sura_model.dart';
import 'package:after_salat/widgets/custom_container.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/utils_extension.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});
  static const String name = '/suraDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10.h,
            children: [
              Text(suraModel.suraName, style: context.textTheme.labelLarge),

              Text(
                'أَعُوْذُ بِاللهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ\n '
                '(উচ্চারণ: আউজুবিল্লাহি মিনাশ শাইতানির রাজিম।) \n'
                '(অর্থ: হে আল্লাহ, আপনার কাছে বিতাড়িত শয়তান থেকে আশ্রয় প্রার্থনা করছি। )',
                style: context.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),

              Text(
                'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِِ\n '
                '(উচ্চারণ: বিসমিল্লাহির রাহমানির রাহিম।) \n'
                '(অর্থ: পরম করুণাময় ও অসীম দয়ালু আল্লাহর নামে।)',
                style: context.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              Divider(color: Colors.black54),
              Expanded(
                child: ListView.separated(
                  itemCount: suraModel.ayatList.length,
                  itemBuilder: (context, index) {
                    final ayat = suraModel.ayatList[index];
                    return CustomContainer(
                      child: Column(
                        spacing: 10.h,
                        children: [
                          Text(
                            ayat.arabic,
                            style: context.textTheme.bodyMedium,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            'উচ্চারণ: ${ayat.banglaUcharon}',
                            style: context.textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          Divider(color: Colors.black26),
                          Text(
                            'অর্থ: ${ayat.banglaOrtho}',
                            style: context.textTheme.titleMedium,
                            textAlign: TextAlign.left,
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
