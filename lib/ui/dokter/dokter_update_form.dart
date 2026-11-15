import 'package:material_ui/material_ui.dart';

import '../../model/dokter.dart';
import 'dokter_detail.dart';

class DokterUpdateForm extends StatefulWidget {
  final Dokter dokter;

  const DokterUpdateForm({super.key, required this.dokter});
  @override
  _DokterUpdateFormState createState() => _DokterUpdateFormState();
}

class _DokterUpdateFormState extends State<DokterUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaDokterCtrl = TextEditingController();
  final _spesialisCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaDokterCtrl.text = widget.dokter.namaDokter;
      _spesialisCtrl.text = widget.dokter.spesialis;
      _nomorTeleponCtrl.text = widget.dokter.nomorTelepon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Dokter")),
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
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DokterDetail(dokter: dokter)),
        );
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
