import 'package:flutter/material.dart';
import 'package:klinik_app/ui/beranda.dart';
import 'package:klinik_app/ui/login.dart';
import '/../ui/Poli/poli_page.dart';
import '/../ui/Pegawai/pegawai_page.dart';
import '/../ui/Pasien/pasien_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Maria Ervina Asinta Lensi"),
            accountEmail: null,
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.desktop_mac_rounded),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt_rounded),
            title: Text("Pegawai"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pegawaiPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text("Pasien"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pasienPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) =>false);
            },
          )
        ],
      ),
    );
  }
}
