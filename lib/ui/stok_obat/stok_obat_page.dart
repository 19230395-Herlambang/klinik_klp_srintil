import 'package:material_ui/material_ui.dart';

import '../../widget/sidebar.dart';
import '../../model/stok_obat.dart';
import 'stok_obat_item.dart';
import 'stok_obat_form.dart';

class StokObatPage extends StatefulWidget {
  const StokObatPage({super.key});

  @override
  State<StokObatPage> createState() => _StokObatPageState();
}

class _StokObatPageState extends State<StokObatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Stok Obat"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StokObatForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          StokObatItem(
            obat: StokObat(
              namaObat: "Paracetamol 500 mg",
              jumlah: 120,
              satuan: "Tablet",
            ),
          ),
          StokObatItem(
            obat: StokObat(
              namaObat: "Amoxicillin 500 mg",
              jumlah: 80,
              satuan: "Kapsul",
            ),
          ),
          StokObatItem(
            obat: StokObat(namaObat: "OBH Sirup", jumlah: 35, satuan: "Botol"),
          ),
        ],
      ),
    );
  }
}
