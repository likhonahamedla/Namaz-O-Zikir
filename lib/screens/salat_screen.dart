import 'package:after_salat/data/salat_niyot_data.dart';
import 'package:after_salat/models/dua_item_model.dart';
import 'package:after_salat/models/salat_niyot_model.dart';
import 'package:after_salat/screens/salat_niyot_screen.dart';
import 'package:after_salat/widgets/custom_button.dart';
import 'package:after_salat/widgets/custom_container.dart';
import 'package:after_salat/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../data/salat_important_data.dart';
import '../extensions/utils_extension.dart';

class SalatScreen extends StatefulWidget {
  const SalatScreen({super.key});
  static const String name = '/namazScreen';

  @override
  State<SalatScreen> createState() => _SalatScreenState();
}

class _SalatScreenState extends State<SalatScreen> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<SalatNiyotModel> salatList = salatDataList
        .map((salat) => SalatNiyotModel.fromMap(salat))
        .toList();
    List<DuaItemModel> salatElementsList = salatElements
        .map((salatData) => DuaItemModel.fromMap(salatData))
        .toList();
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 10.h,
            children: [
              Text('নামাজের নিয়ত', style: context.textTheme.labelLarge),
              _salatNiyot(salatList),
              Divider(),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: salatElementsList.length,
                  itemBuilder: (context, index) {
                    final element = salatElementsList[index];
                    return Column(
                      children: [
                        CustomButton(
                          buttonText: element.title,
                          onTap: () => _toggleSelection(index),
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          child: _selectedIndex == index
                              ? CustomContainer(
                                  child: Column(
                                    children: [
                                      Text(
                                        element.arabic,
                                        style: context.textTheme.bodyMedium,
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        'উচ্চারণ: ${element.banglaUcharon!}',
                                        style: context.textTheme.titleMedium,
                                      ),
                                      Divider(color: Colors.black26),
                                      Text(
                                        ' অর্থ: ${element.banglaOrtho!}',
                                        style: context.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ],
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

  SizedBox _salatNiyot(List<SalatNiyotModel> salatList) {
    return SizedBox(
      height: 170.h,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: salatList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final salat = salatList[index];
          return InkWell(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 20.r, child: LineIcon(LineIcons.mosque)),
                Text(salat.salatName),
              ],
            ),
            onTap: () => _niyotButton(salat),
          );
        },
      ),
    );
  }

  void _niyotButton(SalatNiyotModel salat) {
    Navigator.pushNamed(context, SalatNiyotScreen.name, arguments: salat);
  }

  void _toggleSelection(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }
}
