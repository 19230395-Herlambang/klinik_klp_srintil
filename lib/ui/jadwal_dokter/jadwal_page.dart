import 'package:material_ui/material_ui.dart';

import '../../widget/sidebar.dart';
import '../../model/jadwal_dokter.dart';
import 'jadwal_dokter_item.dart';
import 'jadwal_dokter_form.dart';

class JadwalDokterPage extends StatefulWidget {
  const JadwalDokterPage({super.key});

  @override
  State<JadwalDokterPage> createState() => _JadwalDokterPageState();
}

class _JadwalDokterPageState extends State<JadwalDokterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Jadwal Dokter"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JadwalDokterForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          JadwalDokterItem(
            jadwal: JadwalDokter(
              namaDokter: "dr. Andi Pratama",
              hari: "Senin",
              jamMulai: "08:00",
              jamSelesai: "12:00",
            ),
          ),
          JadwalDokterItem(
            jadwal: JadwalDokter(
              namaDokter: "dr. Siti Rahma, Sp.A",
              hari: "Selasa",
              jamMulai: "09:00",
              jamSelesai: "14:00",
            ),
          ),
          JadwalDokterItem(
            jadwal: JadwalDokter(
              namaDokter: "drg. Budi Santoso",
              hari: "Rabu",
              jamMulai: "13:00",
              jamSelesai: "17:00",
            ),
          ),
        ],
      ),
    );
  }
}
