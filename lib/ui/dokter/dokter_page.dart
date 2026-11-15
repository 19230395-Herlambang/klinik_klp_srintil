import 'package:material_ui/material_ui.dart';

import '../../widget/sidebar.dart';
import '../../model/dokter.dart';
import 'dokter_item.dart';
import 'dokter_form.dart';

class DokterPage extends StatefulWidget {
  const DokterPage({super.key});

  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Dokter"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DokterForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          DokterItem(
            dokter: Dokter(
              namaDokter: "dr. Andi Pratama",
              spesialis: "Umum",
              nomorTelepon: "081234567890",
            ),
          ),
          DokterItem(
            dokter: Dokter(
              namaDokter: "dr. Siti Rahma, Sp.A",
              spesialis: "Anak",
              nomorTelepon: "081298765432",
            ),
          ),
          DokterItem(
            dokter: Dokter(
              namaDokter: "drg. Budi Santoso",
              spesialis: "Gigi",
              nomorTelepon: "082112345678",
            ),
          ),
        ],
      ),
    );
  }
}
