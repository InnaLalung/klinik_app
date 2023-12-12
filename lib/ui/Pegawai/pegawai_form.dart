import 'package:flutter/material.dart';
import '/../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tglPegawaiCtrl = TextEditingController();
  final _telponPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            _fieldNipPegawai(),
            SizedBox(height: 10),
            _fieldNamaPegawai(),
            SizedBox(height: 10),
            _fieldtglPegawai(),
            SizedBox(height: 10),
            _fieldtelponPegawai(),
            SizedBox(height: 10),
            _fieldemailPegawai(),
            SizedBox(height: 10),
            _fieldpasswordPegawai(),
            SizedBox(height: 20),
            _tombolSimpan()
          ],
        )),
      ),
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldNipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nip Pegawai"),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldtglPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir Pegawai"),
      controller: _tglPegawaiCtrl,
    );
  }

  _fieldtelponPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "No. Telephone Pegawai"),
      controller: _telponPegawaiCtrl,
    );
  }

  _fieldemailPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email Pegawai"),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldpasswordPegawai() {
    return TextField(
      obscureText: true,
      decoration: const InputDecoration(labelText: "Password Pegawai"),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pegawai pegawai = Pegawai(
              nip: _nipPegawaiCtrl.text,
              nama: _namaPegawaiCtrl.text,
              tanggal_lahir: _tglPegawaiCtrl.text,
              nomor_telepon: _telponPegawaiCtrl.text,
              email: _emailPegawaiCtrl.text,
              password: _passwordPegawaiCtrl.text);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => pegawaiDetail(pegawai: pegawai)));
        },
        child: const Text("Simpan Perubahan"));
  }
}
