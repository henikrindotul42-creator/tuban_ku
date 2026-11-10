class Pertanyaan {
  final int id;
  final int levelId;
  final String pertanyaan;
  final List<String> pilihan;
  final int jawabanBenar;

  Pertanyaan({
    required this.id,
    required this.levelId,
    required this.pertanyaan,
    required this.pilihan,
    required this.jawabanBenar,
  });
}