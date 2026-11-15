import 'package:material_ui/material_ui.dart';

import 'dokter_page.dart';
import 'dokter_update_form.dart';
import '../../model/dokter.dart';

class DokterDetail extends StatefulWidget {
  final Dokter dokter;

  const DokterDetail({super.key, required this.dokter});

  @override
  State<DokterDetail> createState() => _DokterDetailState();
}

class _DokterDetailState extends State<DokterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Dokter")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Dokter : ${widget.dokter.namaDokter}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Spesialis : ${widget.dokter.spesialis}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "No. Telepon : ${widget.dokter.nomorTelepon}",
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
            builder: (context) => DokterUpdateForm(dokter: widget.dokter),
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
                  MaterialPageRoute(builder: (context) => DokterPage()),
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
