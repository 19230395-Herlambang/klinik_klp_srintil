import 'package:material_ui/material_ui.dart';

import '../../model/jadwal_dokter.dart';
import 'jadwal_dokter_detail.dart';

class JadwalDokterItem extends StatelessWidget {
  final JadwalDokter jadwal;

  const JadwalDokterItem({super.key, required this.jadwal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(jadwal.namaDokter),
          subtitle: Text(
            "${jadwal.hari}, ${jadwal.jamMulai} - ${jadwal.jamSelesai}",
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JadwalDokterDetail(jadwal: jadwal),
          ),
        );
      },
    );
  }
}
