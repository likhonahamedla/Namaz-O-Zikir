import 'package:after_salat/models/sura_ayat_model.dart';

class SuraModel {
  final String suraName;
  List<AyatModel> ayatList;
  SuraModel({required this.suraName, required this.ayatList});

  factory SuraModel.fromMap(Map<String, dynamic> sura) {
    return SuraModel(
      suraName: sura['sura_name'] ?? 'Unknown',
      ayatList: (sura['ayat'] as List? ?? [])
          .map((ayat) => AyatModel.fromMap(ayat as Map<String, dynamic>))
          .toList(),
    );
  }
}
