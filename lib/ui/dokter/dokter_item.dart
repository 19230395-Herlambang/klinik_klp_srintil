import 'package:material_ui/material_ui.dart';

import '../../model/dokter.dart';
import 'dokter_detail.dart';

class DokterItem extends StatelessWidget {
  final Dokter dokter;

  const DokterItem({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(dokter.namaDokter),
          subtitle: Text(dokter.spesialis),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DokterDetail(dokter: dokter)),
        );
      },
    );
  }
}
