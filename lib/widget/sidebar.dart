import 'package:material_ui/material_ui.dart';

import '../ui/umum/beranda.dart';
import '../ui/umum/login.dart';
import '../ui/poli/poli_page.dart';
import '../ui/dokter/dokter_page.dart';
import '../ui/jadwal_dokter/jadwal_dokter_page.dart';
import '../ui/stok_obat/stok_obat_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("admin@admin.com"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PoliPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text("Dokter"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DokterPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Jadwal Dokter"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JadwalDokterPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.medication),
            title: Text("Stok Obat"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StokObatPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
