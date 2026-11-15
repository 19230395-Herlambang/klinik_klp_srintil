class JadwalDokter {
  String? id;
  String namaDokter;
  String hari;
  String jamMulai;
  String jamSelesai;

  JadwalDokter({
    this.id,
    required this.namaDokter,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
  });
}