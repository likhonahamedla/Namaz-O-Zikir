import 'package:after_salat/models/dua_item_model.dart';

class SalatNiyotModel {
  String salatName;
  List<DuaItemModel> itemModel;
  SalatNiyotModel({required this.salatName, required this.itemModel});

  factory SalatNiyotModel.fromMap(Map<String, dynamic> niyot) {
    return SalatNiyotModel(
      salatName: niyot["salat_name"],
      itemModel: (niyot["items"] as List ?? [])
          .map((items) => DuaItemModel.fromMap(items))
          .toList(),
    );
  }
}
