import 'package:material_ui/material_ui.dart';

import '../../model/stok_obat.dart';
import 'stok_obat_detail.dart';

class StokObatItem extends StatelessWidget {
  final StokObat obat;

  const StokObatItem({super.key, required this.obat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(obat.namaObat),
          subtitle: Text("${obat.jumlah} ${obat.satuan}"),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StokObatDetail(obat: obat)),
        );
      },
    );
  }
}
