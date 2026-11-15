import 'package:material_ui/material_ui.dart';

import '../../model/jadwal_dokter.dart';
import 'jadwal_dokter_detail.dart';

class JadwalDokterUpdateForm extends StatefulWidget {
  final JadwalDokter jadwal;

  const JadwalDokterUpdateForm({super.key, required this.jadwal});
  @override
  _JadwalDokterUpdateFormState createState() => _JadwalDokterUpdateFormState();
}

class _JadwalDokterUpdateFormState extends State<JadwalDokterUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaDokterCtrl = TextEditingController();
  final _hariCtrl = TextEditingController();
  final _jamMulaiCtrl = TextEditingController();
  final _jamSelesaiCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaDokterCtrl.text = widget.jadwal.namaDokter;
      _hariCtrl.text = widget.jadwal.hari;
      _jamMulaiCtrl.text = widget.jadwal.jamMulai;
      _jamSelesaiCtrl.text = widget.jadwal.jamSelesai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Jadwal Dokter")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaDokter(),
              _fieldHari(),
              _fieldJamMulai(),
              _fieldJamSelesai(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _fieldNamaDokter() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Dokter"),
      controller: _namaDokterCtrl,
    );
  }

  TextField _fieldHari() {
    return TextField(
      decoration: const InputDecoration(labelText: "Hari"),
      controller: _hariCtrl,
    );
  }

  TextField _fieldJamMulai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jam Mulai (contoh 08:00)"),
      controller: _jamMulaiCtrl,
    );
  }

  TextField _fieldJamSelesai() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Jam Selesai (contoh 12:00)",
      ),
      controller: _jamSelesaiCtrl,
    );
  }

  ElevatedButton _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        JadwalDokter jadwal = JadwalDokter(
          namaDokter: _namaDokterCtrl.text,
          hari: _hariCtrl.text,
          jamMulai: _jamMulaiCtrl.text,
          jamSelesai: _jamSelesaiCtrl.text,
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => JadwalDokterDetail(jadwal: jadwal),
          ),
        );
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
