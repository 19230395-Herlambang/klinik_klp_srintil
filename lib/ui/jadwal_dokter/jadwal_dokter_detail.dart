import 'package:material_ui/material_ui.dart';

import 'jadwal_dokter_page.dart';
import 'jadwal_dokter_update_form.dart';
import '../../model/jadwal_dokter.dart';

class JadwalDokterDetail extends StatefulWidget {
  final JadwalDokter jadwal;

  const JadwalDokterDetail({super.key, required this.jadwal});

  @override
  State<JadwalDokterDetail> createState() => _JadwalDokterDetailState();
}

class _JadwalDokterDetailState extends State<JadwalDokterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Jadwal Dokter")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Dokter : ${widget.jadwal.namaDokter}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text("Hari : ${widget.jadwal.hari}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(
            "Jam Mulai : ${widget.jadwal.jamMulai}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Jam Selesai : ${widget.jadwal.jamSelesai}",
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
            builder: (context) => JadwalDokterUpdateForm(jadwal: widget.jadwal),
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
                  MaterialPageRoute(builder: (context) => JadwalDokterPage()),
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
