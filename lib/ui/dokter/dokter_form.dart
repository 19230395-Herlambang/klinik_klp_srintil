import 'package:material_ui/material_ui.dart';

import '../../model/dokter.dart';
import 'dokter_detail.dart';

class DokterForm extends StatefulWidget {
  const DokterForm({super.key});
  @override
  _DokterFormState createState() => _DokterFormState();
}

class _DokterFormState extends State<DokterForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaDokterCtrl = TextEditingController();
  final _spesialisCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Dokter")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaDokter(),
              _fieldSpesialis(),
              _fieldNomorTelepon(),
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

  TextField _fieldSpesialis() {
    return TextField(
      decoration: const InputDecoration(labelText: "Spesialis"),
      controller: _spesialisCtrl,
    );
  }

  TextField _fieldNomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
      keyboardType: TextInputType.phone,
    );
  }

  ElevatedButton _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Dokter dokter = Dokter(
          namaDokter: _namaDokterCtrl.text,
          spesialis: _spesialisCtrl.text,
          nomorTelepon: _nomorTeleponCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DokterDetail(dokter: dokter)),
        );
      },
      child: const Text("Simpan"),
    );
  }
}
