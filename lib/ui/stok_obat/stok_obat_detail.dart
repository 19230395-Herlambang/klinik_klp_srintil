import 'package:material_ui/material_ui.dart';

import 'stok_obat_page.dart';
import 'stok_obat_update_form.dart';
import '../../model/stok_obat.dart';

class StokObatDetail extends StatefulWidget {
  final StokObat obat;

  const StokObatDetail({super.key, required this.obat});

  @override
  State<StokObatDetail> createState() => _StokObatDetailState();
}

class _StokObatDetailState extends State<StokObatDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Stok Obat")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Obat : ${widget.obat.namaObat}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Jumlah : ${widget.obat.jumlah}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Satuan : ${widget.obat.satuan}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          ),
        ],
      ),
    );
  }

  ElevatedButton _tombolUbah() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StokObatUpdateForm(obat: widget.obat),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  ElevatedButton _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StokObatPage()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("YA"),
            ),
            // tombol batal
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Tidak"),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
