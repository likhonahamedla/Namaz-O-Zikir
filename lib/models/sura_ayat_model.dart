class AyatModel {
  final int line;
  final String arabic;
  final String banglaUcharon;
  final String banglaOrtho;

  AyatModel({
    required this.arabic,
    required this.banglaUcharon,
    required this.banglaOrtho,
    required this.line,
  });

  factory AyatModel.fromMap(Map<String, dynamic> ayat) {
    return AyatModel(
      arabic: ayat['arabic'] ?? '',
      banglaUcharon: ayat['bangla_ucharon'] ?? '',
      banglaOrtho: ayat['bangla_ortho'] ?? '',
      line: ayat['no'] ?? '',
    );
  }
}
