class DuaItemModel {
  final String title;
  final String arabic;
  final String? banglaUcharon;
  final String? banglaOrtho;
  final String? repeat;
  final String? fojilot;
  final int? tasbih;

  DuaItemModel({
    required this.title,
    required this.arabic,
    this.banglaUcharon,
    this.banglaOrtho,
    this.repeat,
    this.fojilot,
    this.tasbih,
  });
  factory DuaItemModel.fromMap(Map<String, dynamic> dua) {
    return DuaItemModel(
      title: dua['title'] ?? '',
      arabic: dua['arabic'] ?? '',
      banglaUcharon: dua['bangla_ucharon'] ?? '',
      banglaOrtho: dua['bangla_ortho'] ?? '',
      repeat: dua['repeat'] ?? '',
      fojilot: dua['fojilot'] ?? '',
      tasbih: int.tryParse(dua['tasbih'].toString()),
    );
  }
}
