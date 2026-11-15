import 'package:material_ui/material_ui.dart';

import '../../model/stok_obat.dart';
import 'stok_obat_detail.dart';

class StokObatForm extends StatefulWidget {
  const StokObatForm({super.key});
  @override
  _StokObatFormState createState() => _StokObatFormState();
}

class _StokObatFormState extends State<StokObatForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaObatCtrl = TextEditingController();
  final _jumlahCtrl = TextEditingController();
  final _satuanCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Stok Obat")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaObat(),
              _fieldJumlah(),
              _fieldSatuan(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _fieldNamaObat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Obat"),
      controller: _namaObatCtrl,
    );
  }

  TextField _fieldJumlah() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah"),
      controller: _jumlahCtrl,
      keyboardType: TextInputType.number,
    );
  }

  TextField _fieldSatuan() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Satuan (Tablet, Botol, dll)",
      ),
      controller: _satuanCtrl,
    );
  }

  ElevatedButton _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        StokObat obat = StokObat(
          namaObat: _namaObatCtrl.text,
          jumlah: int.tryParse(_jumlahCtrl.text) ?? 0,
          satuan: _satuanCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StokObatDetail(obat: obat)),
        );
      },
      child: const Text("Simpan"),
    );
  }
}
