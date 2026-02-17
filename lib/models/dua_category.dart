import 'package:after_salat/data/fojor_data.dart';
import 'package:after_salat/data/johur_asor_esha_data.dart';

import '../data/jummah_dua_data.dart';
import '../data/magrib_dua_data.dart';
import '../data/other_dua_data.dart';
import '../data/sleep_data.dart';
import 'dua_item_model.dart';

class DuaCategory {
  final String title;
  final List<DuaItemModel> items;

  DuaCategory({required this.title, required this.items});
}

final List<DuaCategory> duaCategories = [
  DuaCategory(
    title: 'ফজর (فجر)',
    items: fajarData.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'জোহর (ظہر)',
    items: johurAsorIsha.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'আসর (عصر)',
    items: johurAsorIsha.map(DuaItemModel.fromMap).toList(),
  ),

  DuaCategory(
    title: 'মাগরিব (مغرب)',
    items: magribData.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'এশা (عشاء)',
    items: johurAsorIsha.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'জুমুআহ (الجمعة)',
    items: jummahDuaData.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'রাতে ঘুমানোর আগে',
    items: sleepData.map(DuaItemModel.fromMap).toList(),
  ),
  DuaCategory(
    title: 'দিনের যেকোন সময়',
    items: otherDuaData.map(DuaItemModel.fromMap).toList(),
  ),
];
