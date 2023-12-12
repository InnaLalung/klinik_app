import 'package:flutter/material.dart';
import '/../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tglPegawaiCtrl = TextEditingController();
  final _telponPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nipPegawaiCtrl.text = widget.pegawai.nip;
      _namaPegawaiCtrl.text = widget.pegawai.nama;
      _tglPegawaiCtrl.text = widget.pegawai.tanggal_lahir;
      _telponPegawaiCtrl.text = widget.pegawai.nomor_telepon;
      _emailPegawaiCtrl.text = widget.pegawai.email;
      _passwordPegawaiCtrl.text = widget.pegawai.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
          ),
        ),
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
          Pegawai pegawai = new Pegawai(
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
