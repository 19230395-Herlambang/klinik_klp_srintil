import 'package:material_ui/material_ui.dart';

import '../../model/stok_obat.dart';
import 'stok_obat_detail.dart';

class StokObatUpdateForm extends StatefulWidget {
  final StokObat obat;

  const StokObatUpdateForm({super.key, required this.obat});
  @override
  _StokObatUpdateFormState createState() => _StokObatUpdateFormState();
}

class _StokObatUpdateFormState extends State<StokObatUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaObatCtrl = TextEditingController();
  final _jumlahCtrl = TextEditingController();
  final _satuanCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaObatCtrl.text = widget.obat.namaObat;
      _jumlahCtrl.text = widget.obat.jumlah.toString();
      _satuanCtrl.text = widget.obat.satuan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Stok Obat")),
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
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StokObatDetail(obat: obat)),
        );
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
