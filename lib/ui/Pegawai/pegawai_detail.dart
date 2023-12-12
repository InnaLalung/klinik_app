import 'package:flutter/material.dart';
import 'package:klinik_app/ui/Pegawai/pegawai_page.dart';
import '/../model/pegawai.dart';
import 'pegawai_update_form.dart';
import 'pegawai_page.dart';

class pegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const pegawaiDetail({super.key, required this.pegawai});

  @override
  State<pegawaiDetail> createState() => _pegawaiDetailState();
}

class _pegawaiDetailState extends State<pegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pegawai'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "NIP Pegawai : ${widget.pegawai.nip}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nama Pegawai : ${widget.pegawai.nama}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tanggal Lahir : ${widget.pegawai.tanggal_lahir}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "No. Telepon : ${widget.pegawai.nomor_telepon}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Email : ${widget.pegawai.email}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password : ${widget.pegawai.password}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PegawaiUpdateForm(pegawai: widget.pegawai)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: Text("Yakin ingin menghapus data ini?"),
            actions: [
              //tombol ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => pegawaiPage()));
                },
                child: Text("YA"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              //tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("TIDAK"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Hapus"));
  }
}
