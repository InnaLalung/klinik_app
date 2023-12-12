import 'package:flutter/material.dart';
import '/../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';
import '../widget/sidebar.dart';

class pegawaiPage extends StatefulWidget {
  const pegawaiPage({super.key});

  @override
  State<pegawaiPage> createState() => _pegawaiPageState();
}

class _pegawaiPageState extends State<pegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Data Pegawai'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
              pegawai: Pegawai(
                  nip: 'NIP',
                  nama: 'Maria Ervina Asinta Lensi',
                  tanggal_lahir: 'Tanggal Lahir',
                  nomor_telepon: 'Nomor Telepon',
                  email: 'Email',
                  password: 'Password'))
        ],
      ),
    );
  }
}
