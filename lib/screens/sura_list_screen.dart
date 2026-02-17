import 'package:after_salat/data/sura_data_list.dart';
import 'package:after_salat/models/sura_model.dart';
import 'package:after_salat/screens/sura_details_screen.dart';
import 'package:after_salat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/screen_background.dart';

class SuraListScreen extends StatelessWidget {
  const SuraListScreen({super.key});
  static const String name = '/suraListScreen';

  @override
  Widget build(BuildContext context) {
    List<SuraModel> suraModel = suraList
        .map((sura) => SuraModel.fromMap(sura))
        .toList();
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView.separated(
            itemCount: suraModel.length,
            itemBuilder: (context, index) {
              final sura = suraModel[index];
              return CustomButton(
                buttonText: sura.suraName,
                onTap: () {
                  _suraDetailsButton(context, sura);
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
          ),
        ),
      ),
    );
  }

  void _suraDetailsButton(BuildContext context, SuraModel sura) {
    Navigator.pushNamed(context, SuraDetailsScreen.name, arguments: sura);
  }
}
